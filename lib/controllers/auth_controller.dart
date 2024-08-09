import 'package:flutter/foundation.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;  // Stores firebase_auth package
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;  // Stores cloud_firestore package
  final FirebaseStorage _storage = FirebaseStorage.instance;  // Stores firebase_storage package
  
  
  // Uploads profile picture to Firebase Storage
  _uploadProfileImageToStorage(Uint8List? image) async {
    Reference ref = _storage.ref()
                            .child('profilePics')
                            .child(_auth.currentUser!.uid);
    
    UploadTask uploadTask = ref.putData(image!);  // Stores result of uploaded image
    
    TaskSnapshot snapshot = await uploadTask;
    String downloadURL = await snapshot.ref.getDownloadURL();  // Stores image download URL

    return downloadURL;
  }
  
  // Picks image from phone gallery or device camera
  pickProfileImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();  // Stores image_picker package

    XFile? _file = await _imagePicker.pickImage(source: source);  // Stores picked image

    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('No Image Selected!');
    }
  }

  // Creates new users
  Future<String> signUpUsers(String email, String fullName, String phoneNumber, String password, Uint8List? image) async {
    String res = 'Some error occurred';

    try {
      if (email.isNotEmpty && fullName.isNotEmpty && phoneNumber.isNotEmpty && password.isNotEmpty && image != null) {
        // Create New User
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, 
          password: password
        );  // Stores user credentials

        String profileImageURL = await _uploadProfileImageToStorage(image);  // Stores image download URL
      
        await _firestore.collection('buyers').doc(cred.user!.uid).set({
          'email': email,
          'fullName': fullName,
          'phoneNumber': phoneNumber,
          'buyerId': cred.user!.uid,
          'address': '',
        });

        res = 'Success';
      } else {
        res = 'Fields must not be empty';
      }
    } catch (e) {}

    return res;
  }


  // Logs in existing users 
  loginUsers(String email, String password) async {
    String res = 'Something went wrong!';

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: password);

        res = 'Success';
      } else {
        res = 'Fields must not be empty!';
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
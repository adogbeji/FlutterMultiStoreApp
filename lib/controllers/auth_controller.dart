import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;  // Stores firebase_auth package
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;  // Stores cloud_firestore package
  
  // Creates new users
  Future<String> signUpUsers(String email, String fullName, String phoneNumber, String password) async {
    String res = 'Some error occurred';

    try {
      if (email.isNotEmpty && fullName.isNotEmpty && phoneNumber.isNotEmpty && password.isNotEmpty) {
        // Create New User

        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, 
          password: password
        );  // Stores user credentials
      
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
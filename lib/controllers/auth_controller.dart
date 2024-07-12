import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;  // stores firebase_auth package

  Future<String> signUpUsers(String email, String fullName, String phoneNumber, String password) async {
    String res = 'Some error occurred';

    try {
      if (email.isNotEmpty && fullName.isNotEmpty && phoneNumber.isNotEmpty && password.isNotEmpty) {
        // Create New User

        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);  // Stores user credentials
      } else {
        res = 'Fields must not be empty';
      }
    } catch (e) {}

    return res;
  }
}
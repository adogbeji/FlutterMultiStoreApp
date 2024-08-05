// import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:multi_store/controllers/auth_controller.dart';
import 'package:multi_store/utils/show_snackBar.dart';
import 'package:multi_store/views/buyers/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {  
  final AuthController _authController = AuthController();  // Stores AuthController class

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();  // Form key

  late String email;

  late String fullName;

  late String phoneNumber;

  late String password;

  bool _isLoading = false;

  Uint8List? _image;  // Stores image

  // Calls function in AuthController class
  _signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      await _authController.signUpUsers(email, fullName, phoneNumber, password).whenComplete(() {
        setState(() {
          _formKey.currentState!.reset();  // Clears input fields
          _isLoading = false;
        });
      });

      return showSnack(context, 'Congrats, your account has been created!');
    } else {
      setState(() {
        _isLoading = false;
      });
      return showSnack(context, 'Fields must not be empty!');
    }
  }
  
  // Picks image from phone gallery
  selectGalleryImage() async {
    Uint8List im = await _authController.pickProfileImage(ImageSource.gallery);  // Stores picked image

    setState(() {
      _image = im;
    });
  }

  // Captures image with device camera
  selectCameraImage() async {
    Uint8List im = await _authController.pickProfileImage(ImageSource.camera);  // Stores picked image

    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

                Stack(
                  children: [
                    CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.yellow.shade900,
                    ),

                    Positioned(
                      right: -3,
                      top: 1,
                      child: IconButton(
                        onPressed: () {
                          selectGalleryImage();
                        },
                        // icon: const Icon(CupertinoIcons.camera),
                        icon: const Icon(Icons.camera_alt),
                      ),
                    ),
                  ],
                ),
            
                // EMAIL INPUT FIELD
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email must not be empty!';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ),
            
                // NAME INPUT FIELD
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name must not be empty!';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      fullName = value;
                    },                
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                ),
            
                // PHONE NUMBER INPUT FIELD
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Phone number must not be empty!';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      phoneNumber = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                    ),
                  ),
                ),
            
                // PASSWORD INPUT FIELD
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password must not be empty!';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ),
            
                // REGISTER BUTTON
                GestureDetector(
                  onTap: () {
                    _signUpUser();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade900,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: _isLoading ? const CircularProgressIndicator(
                        color: Colors.white,
                      ):
                       const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                        ),
                      ),
                    ),
                  ),
                ),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }),);
                      },
                      child: const Text('Log in'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

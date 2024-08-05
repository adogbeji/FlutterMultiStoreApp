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
                    _image != null ? CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.yellow.shade900,
                      backgroundImage: MemoryImage(_image!),
                    ): CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.yellow.shade900,
                      // backgroundImage: NetworkImage('data:image/jpeg;base64,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'),
                      child: const Icon(Icons.person, size: 60,),
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

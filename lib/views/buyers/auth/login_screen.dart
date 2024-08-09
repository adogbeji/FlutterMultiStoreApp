import 'package:flutter/material.dart';

import 'package:multi_store/controllers/auth_controller.dart';
import 'package:multi_store/utils/show_snackBar.dart';

import 'package:multi_store/views/buyers/main_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // const LoginScreen({super.key});
  final AuthController _authController = AuthController();  // Stores AuthController class

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();  // Form key

  late String email;

  late String password;

  bool _isLoading = false;

  // Calls function in AuthController class
  _loginUsers() async {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      String res = await _authController.loginUsers(email, password);

      if (res == 'Success') {
        // return showSnack(context, 'You are now logged in!');
        return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return const MainScreen();
          }),
        );
      } else {
        return showSnack(context, res);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      return showSnack(context, 'Fields must not be empty!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Log In',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
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
          
              // PASSWORD INPUT FIELD
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextFormField(
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
          
              const SizedBox(height: 20,),
              
              // LOGIN BUTTON
              InkWell(
                onTap: () {
                  _loginUsers();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: _isLoading ? const CircularProgressIndicator(color: Colors.white,): const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 5,
                      ),
                    ),
                  ),
                ),
              ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Need An Account?'),
                  TextButton(onPressed: () {}, child: const Text('Register'),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

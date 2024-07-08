import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Log In', style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),

            // EMAIL iNPUT FIELD
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),

            // PASSWORD iNPUT FIELD
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
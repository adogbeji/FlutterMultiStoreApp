import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Create Account', style: TextStyle(fontSize: 20,),),

            CircleAvatar(
              radius: 64,
              backgroundColor: Colors.yellow.shade900,
            ),
          ],
        ),
      ),
    );
  }
}
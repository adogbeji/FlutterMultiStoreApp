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
            const Text(
              'Create Account',
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            CircleAvatar(
              radius: 64,
              backgroundColor: Colors.yellow.shade900,
            ),

            // EMAIL INPUT FIELD
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),

            // NAME INPUT FIELD
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
            ),

            // PHONE NUMBER INPUT FIELD
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
            ),

            // PASSWORD INPUT FIELD
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),

            // REGISTER BUTTON
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.yellow.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () {},
                  child: const Text('Log in'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

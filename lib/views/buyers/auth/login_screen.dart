import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // const LoginScreen({super.key});
  late String email;

  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.yellow.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 5,
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
    );
  }
}

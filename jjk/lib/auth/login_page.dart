import 'package:flutter/material.dart';
import 'package:jjk/auth/auth_service.dart';
import '../menu.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                dynamic result = await _auth.signInWithEmailAndPassword(
                    emailController.text, passwordController.text);
                if (result == null) {
                  print('Sign in failed!');
                } else {
                }
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MenuPage()),
                  );
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

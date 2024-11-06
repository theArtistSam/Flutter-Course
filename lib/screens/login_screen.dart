import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final String username = "abc@example.com";
  final String password = "abc@123";
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 50, 25, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.network(
                    "https://images.unsplash.com/reserve/LJIZlzHgQ7WPSh5KVTCB_Typewriter.jpg?q=80&w=1992&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                const Text(
                  "App name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Text(
              "Login Screen",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _usernameController,
              onChanged: (value) {
                // Handle login username input
              },
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _passwordController,
              onChanged: (value) {
                // Handle login password input
              },
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                // ob
                // obscureText: true,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // Handle login button press
                String username = _usernameController.text.trim();
                String password = _passwordController.text.trim();

                if (username == this.username && password == this.password) {
                  // Login successful
                  // Navigate to the home screen

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login successful!')),
                  );
                  await Future.delayed(const Duration(seconds: 3));
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                } else {
                  // Login failed
                  // Show error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Invalid Login Credientials!')),
                  );
                }
              },
              child: const Text('Login'),
            ),
            const Text('Forgot Password?'),
            const SizedBox(height: 16),
            const Text('Don\'t have an account? Sign up'),
          ],
        ),
      ),
    );
  }
}

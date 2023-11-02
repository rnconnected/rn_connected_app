import 'package:flutter/material.dart';

import '../verification/verificationpage.dart';

class UserRegistrationPage extends StatefulWidget {
  const UserRegistrationPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserRegistrationPageState createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool passwordsMatch = true; // Add a variable to track password matching

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // User registration UI components...
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
                obscureText: obscurePassword,
              ),
              TextFormField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureConfirmPassword = !obscureConfirmPassword;
                      });
                    },
                  ),
                ),
                obscureText: obscureConfirmPassword,
                // Apply a custom style to show red text if passwords don't match
                style: TextStyle(
                  color: passwordsMatch ? null : Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Check if passwords match
                  if (passwordController.text ==
                      confirmPasswordController.text) {
                    setState(() {
                      passwordsMatch = true;
                    });
                    // Passwords match, you can proceed with registration logic
                    // Replace this logic with navigation to the VerificationPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerificationPage(
                          email: emailController.text,
                        ),
                      ),
                    );
                  } else {
                    setState(() {
                      passwordsMatch = false;
                    });
                    // Passwords don't match, show an error message or handle accordingly
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 35),
                  backgroundColor: const Color(0xFF111858),
                ),
                child: const Text('Register'),
              ),

              if (!passwordsMatch) // Show error message if passwords don't match
                const Text(
                  'Password and Confirm Password do not match',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
              const SizedBox(height: 10),
              const Text('or'),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

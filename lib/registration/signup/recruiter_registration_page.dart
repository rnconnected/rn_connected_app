import 'package:flutter/material.dart';

import '../verification/verificationpage.dart';

class RecruiterRegistrationPage extends StatefulWidget {
  const RecruiterRegistrationPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RecruiterRegistrationPageState createState() =>
      _RecruiterRegistrationPageState();
}

class _RecruiterRegistrationPageState extends State<RecruiterRegistrationPage> {
  TextEditingController organizationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true; // Initially, the password is obscured

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Recruiter registration UI components...
              TextFormField(
                controller: organizationController,
                decoration:
                    const InputDecoration(labelText: 'Organization Name'),
              ),
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
                obscureText: obscurePassword, // Toggle password visibility
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Replace this logic with navigation to the VerificationPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationPage(
                        email: emailController.text,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 35),
                  backgroundColor: const Color(0xFF111858),
                ),
                child: const Text('Register'),
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

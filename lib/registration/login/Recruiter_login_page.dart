import 'package:flutter/material.dart';

class RecruiterLoginPage extends StatefulWidget {
  const RecruiterLoginPage({Key? key}) : super(key: key);

  @override
  _RecruiterLoginPageState createState() => _RecruiterLoginPageState();
}

class _RecruiterLoginPageState extends State<RecruiterLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Recruiter login UI components...
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement recruiter login logic here
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 35),
                  backgroundColor: const Color(0xFF111858),
                ),
                child: const Text('Login'),
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

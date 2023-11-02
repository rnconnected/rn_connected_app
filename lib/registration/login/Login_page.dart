import 'package:flutter/material.dart';
import '../signup/registration_page.dart';
import 'User_Login_Page.dart';
import 'recruiter_login_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isUserLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 350.0,
                child: Container(
                  color: const Color(0xFF174960),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/login/1.png"),
                      const SizedBox(height: 20),
                      const Text(
                        'Welcome Back!',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'Connect, Collaborate and Network With Nurses Worldwide',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isUserLogin = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isUserLogin ? const Color(0xFF174960) : Colors.grey,
                      minimumSize: const Size(150, 35),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                        ),
                      ),
                    ),
                    child: const Text('User'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isUserLogin = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isUserLogin ? Colors.grey : const Color(0xFF174960),
                      minimumSize: const Size(150, 35),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                      ),
                    ),
                    child: const Text('Recruiter'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (isUserLogin) const UserLoginPage(), // Show User Login page
              if (!isUserLogin) const RecruiterLoginPage(),
              const SizedBox(height: 20),
              const Text('If you already have an account,'),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationPage()),
                  );
                },
                child: const Text('Sign up here'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

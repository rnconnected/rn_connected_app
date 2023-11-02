import 'package:flutter/material.dart';
import '../login/Login_page.dart';
import 'user_registration_page.dart';
import 'recruiter_registration_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isUserRegistration = true;

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
                      Image.asset("assets/images/signup/1.png"),
                      const SizedBox(height: 20),
                      const Text(
                        'Join RN Connected Community',
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
                        isUserRegistration = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isUserRegistration
                          ? const Color(0xFF174960)
                          : Colors.grey,
                      minimumSize: const Size(150, 35),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              8.0), // Adjust the radius as needed
                          bottomLeft: Radius.circular(
                              8.0), // Adjust the radius as needed
                        ),
                      ),
                    ),
                    child: const Text('User'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isUserRegistration = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isUserRegistration
                          ? Colors.grey
                          : const Color(0xFF174960),
                      minimumSize: const Size(150, 35),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                              8.0), // Adjust the radius as needed
                          bottomRight: Radius.circular(
                              8.0), // Adjust the radius as needed
                        ),
                      ),
                    ),
                    child: const Text('Recruiter'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (isUserRegistration) const UserRegistrationPage(),
              if (!isUserRegistration) const RecruiterRegistrationPage(),
              const SizedBox(height: 20),
              const Text('If you already have an account,'),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('Log in here'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

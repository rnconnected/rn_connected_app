import 'package:flutter/material.dart';
import 'package:rn_connected/dashboard/dashboard.dart';
import 'numeric_keyboard.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key, required String email}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  List<String> otp = ['', '', '', ''];
  String errorMessage = '';
  bool showLines = true;

  void onKeyTapped(String key) {
    setState(() {
      if (showLines) {
        showLines = false;
      }

      if (key == 'clear') {
        otp = ['', '', '', ''];
        errorMessage = '';
      } else if (key == 'enter') {
        final enteredOTP = otp.join();
        if (enteredOTP.length == 4) {
          if (validateOTP(enteredOTP)) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DashboardPage(),
              ),
            );
          } else {
            errorMessage = 'Incorrect OTP. Please try again.';
          }
        } else {
          errorMessage = 'Please enter a 4-digit OTP.';
        }
      } else {
        for (int i = 0; i < otp.length; i++) {
          if (otp[i].isEmpty) {
            otp[i] = key;
            break;
          }
        }
      }
    });
  }

  bool validateOTP(String enteredOTP) {
    return enteredOTP == '1234'; // Replace with your validation logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Image.asset(
                "assets/images/verification/mail.png",
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 20),
              const Text(
                'Verify your account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    errorMessage,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Please enter the OTP sent to your email account to verify your account and continue with the registration process.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              if (showLines)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < otp.length; i++)
                      Container(
                        width: 40,
                        height: 2,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.black,
                      ),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < otp.length; i++)
                    Container(
                      width: 40,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        otp[i],
                        style: TextStyle(fontSize: 20, decoration: TextDecoration.underline),
                      ),
                    ),
                ],
              ),
              NumericKeyboard(onKeyTapped: onKeyTapped),
            ],
          ),
        ),
      ),
    );
  }
}

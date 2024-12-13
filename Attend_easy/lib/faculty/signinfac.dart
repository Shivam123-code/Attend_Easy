import 'package:attend_easy/faculty/loginfac.dart';
import 'package:attend_easy/faculty/verification.dart';
import 'package:flutter/material.dart';

class SignInFac extends StatefulWidget {
  const SignInFac({super.key});

  @override
  State<SignInFac> createState() => _SignInState();
}

class _SignInState extends State<SignInFac> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      bool isDesktop = Constraints.maxWidth > 600;
      double screenWidth = Constraints.maxWidth;
      double screenHeight = Constraints.maxHeight;

      return Center(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Join AttendEasy Today!',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Form(
              child: Container(
                width: screenWidth * 1.0,
                height: screenHeight * 1.0,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: const Text(
                        'Create your account to manage classes and track attendance effortlessly.',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: const Text(
                        'Staff ID',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: ' Enter your id number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: const Text(
                        'Phone No.',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: ' Enter your phone number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: const Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: ' Choose password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: const Text(
                        'Confirm Password',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: ' Confirm password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      child: Row(
                        children: [
                          Container(
                            child: Checkbox(
                              value: isChecked,
                              onChanged: (bool? newValue) {
                                setState(
                                  () {
                                    isChecked = newValue!;
                                  },
                                );
                              },
                            ),
                          ),
                          Container(
                            child: const Text(
                              'You have agreed with our',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Term & Condition',
                                style: TextStyle(
                                  color: Color(0xFF1C5B41),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Verification()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1DC99E),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (isDesktop ? 0.6 : 0.85),
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            child: const Text('Already have an account?'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginFac()),
                                );
                              },
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                  color: Color(0xFF1DC99E),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

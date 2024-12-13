// import 'package:attend_easy/main.dart';
import 'package:attend_easy/student/signinstu.dart';
import 'package:attend_easy/student/stud_homepage.dart';
import 'package:flutter/material.dart';

class LoginStu extends StatefulWidget {
  const LoginStu({super.key});

  @override
  State<LoginStu> createState() => _LoginState();
}

class _LoginState extends State<LoginStu> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.8,
          color: const Color.fromARGB(255, 249, 249, 249),
          margin: const EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: const Text(
                  'Welcome back to AttendEasy!',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: const Text(
                  'Log in to manage classes and track attendance seamlessly.',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: const Text(
                  'Student ID',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: ' Enter your id number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: const Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                height: 50,
                margin: const EdgeInsets.only(left: 45),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: ' Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                margin: const EdgeInsets.only(left: 38),
                child: Row(
                  children: [
                    Container(
                      child: const Text('Forgot Password?'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Reset it',
                          style: TextStyle(
                            color: Color(0xFF1C5B41),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth * 0.7,
                margin: const EdgeInsets.only(left: 45),
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AttendEasyScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1DC99E),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 45),
                width: screenWidth * 0.7,
                child: Row(
                  children: [
                    Container(
                      child: const Text('Dont have an account'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInStu(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign Up',
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
    );
  }
}

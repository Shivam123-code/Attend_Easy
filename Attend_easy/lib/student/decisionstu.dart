import 'package:attend_easy/student/loginstu.dart';
import 'package:attend_easy/student/signinstu.dart';
import 'package:flutter/material.dart';

class DecisionStu extends StatefulWidget {
  const DecisionStu({super.key});

  @override
  State<DecisionStu> createState() => _DecisionStuState();
}

class _DecisionStuState extends State<DecisionStu> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: screenWidth * 0.7,
            height: screenHeight * 0.5,
            margin: const EdgeInsets.only(top: 45),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/studing_cloud_comp.jpg'),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.15,
          ),
          SizedBox(
            width: screenWidth * 0.75,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginStu(),
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
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: screenWidth * 0.75,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInStu(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD9D9D9),
                foregroundColor: const Color(0xFF1C5B41),
              ),
              child: const Text(
                'Signin',
                style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

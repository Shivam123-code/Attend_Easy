import 'package:attend_easy/faculty/decisionfac.dart';
import 'package:attend_easy/student/decisionstu.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine whether the screen is large or small (desktop or mobile)
        bool isDesktop = constraints.maxWidth > 600;
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;

        return Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                width: screenWidth * (isDesktop ? 0.6 : 0.9),
                height: screenHeight * (isDesktop ? 0.6 : 0.5),
                child: Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left Icon
                      Container(
                        width: screenWidth * (isDesktop ? 0.1 : 0.1),
                        height: screenHeight * (isDesktop ? 0.1 : 0.1),
                        margin: EdgeInsets.only(
                          top: screenHeight * (isDesktop ? 0.42 : 0.37),
                        ),
                        child: const Icon(
                          Icons.calendar_month,
                          size: 40,
                          color: Color(0xFF1C5B41),
                        ),
                      ),
                      // Center Image
                      Expanded(
                        child: Container(
                          height: screenHeight * (isDesktop ? 0.6 : 0.5),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/boy_study.jpg'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      // Right Icon
                      Container(
                        width: screenWidth * (isDesktop ? 0.1 : 0.1),
                        height: screenHeight * (isDesktop ? 0.1 : 0.1),
                        margin: EdgeInsets.only(
                          bottom: screenHeight * (isDesktop ? 0.42 : 0.37),
                        ),
                        child: Image.asset('assets/open_book.png'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.2),
              // Lecturer Button
              SizedBox(
                width: screenWidth * (isDesktop ? 0.5 : 0.75),
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DecisionFac(),
                        ),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1DC99E),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'I am a Lecturer',
                    style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Student Button
              SizedBox(
                width: screenWidth * (isDesktop ? 0.5 : 0.75),
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DecisionStu(),
                        ),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD9D9D9),
                    foregroundColor: const Color(0xFF1C5B41),
                  ),
                  child: const Text(
                    'I am a Student',
                    style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

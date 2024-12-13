import 'dart:async'; // Import for Timer
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting the date and time

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF43c6ac),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const AttendEasyScreen(),
    );
  }
}

class AttendEasyScreen extends StatefulWidget {
  const AttendEasyScreen({super.key});

  @override
  _AttendEasyScreenState createState() => _AttendEasyScreenState();
}

class _AttendEasyScreenState extends State<AttendEasyScreen> {
  String formattedTime = '';
  String formattedDate = '';
  Timer? timer; // For updating time periodically
  TextEditingController sessionCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _updateDateTime(); // Get the initial time and date
    // Update time every second
    timer = Timer.periodic(
        const Duration(seconds: 1), (Timer t) => _updateDateTime());
  }

  void _updateDateTime() {
    DateTime now = DateTime.now();
    setState(() {
      formattedTime =
          DateFormat('hh:mm:ss a').format(now); // Format time as 08:00 AM
      formattedDate = DateFormat('MMM dd yyyy - EEEE')
          .format(now); // Format date as Aug 04 2024 - Monday
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Stop the timer when widget is disposed
    sessionCodeController.dispose();
    super.dispose();
  }

  void _showCheckInBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // To make sure the bottom sheet adapts to content size
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets, // Adjust for keyboard
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: 300, // Set height for the bottom sheet
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Check In",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "Enter the session code that was provided by your lecturer to check in",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: sessionCodeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Session Code",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Here you can add the functionality to handle check-in
                    print("Session Code: ${sessionCodeController.text}");
                    Navigator.pop(
                        context); // Close the bottom sheet after check-in
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFF43c6ac),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 12.0),
                  ),
                  child: const Text(
                    "Click to Check in",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.grey[400]),
            onPressed: () {},
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate responsive sizes based on layout constraints
          double height = constraints.maxHeight;
          double width = constraints.maxWidth;
          double textMultiplier =
              width * 0.06; // Text size responsive multiplier

          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hey Ayush11060!',
                    style: TextStyle(
                      fontSize: textMultiplier, // Responsive text size
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    'Welcome back to SmartAttend!',
                    style: TextStyle(
                      fontSize: width * 0.045, // Responsive text size
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  Text(
                    formattedTime,
                    style: TextStyle(
                      fontSize: width * 0.15, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: width * 0.045, // Responsive font size
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: height * 0.08),
                  GestureDetector(
                    onTap: () {
                      _showCheckInBottomSheet(
                          context); // Show the bottom sheet when tapped
                    },
                    child: Container(
                      height: width * 0.5,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                        color: const Color(0xFF43c6ac).withOpacity(0.1),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF43c6ac),
                          width: 4,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.fingerprint,
                          color: const Color(0xFF43c6ac),
                          size: width * 0.18, // Responsive icon size
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF43c6ac),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

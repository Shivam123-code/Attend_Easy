import 'package:attend_easy/faculty/loginfac.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  final String facultyName;
  final String email; // Add email as a field

  const Profile({super.key, required this.facultyName, required this.email});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          'Faculty Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            onPressed: () {
              _logout(context); // Call logout method
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/images/faculty.jpg'), // Placeholder image
            ),
            const SizedBox(height: 16),
            Text(
              'Name: ${widget.facultyName}', // Access facultyName via widget.facultyName
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: ${widget.email}', // Access email via widget.email
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Department: Computer Science',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'About: Experienced faculty with a passion for teaching and research in artificial intelligence and machine learning.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Logout method
  void _logout(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut(); // Sign out from Firebase

    // Clear the login state
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    // Navigate back to the login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginFac(),
      ),
    );
  }
}

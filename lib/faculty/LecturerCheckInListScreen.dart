import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckedInStudentsPage extends StatefulWidget {
  const CheckedInStudentsPage({super.key});

  @override
  _CheckedInStudentsPageState createState() => _CheckedInStudentsPageState();
}

class _CheckedInStudentsPageState extends State<CheckedInStudentsPage> {
  DateTime? _selectedDate; // Holds the selected date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checked-In Students'),
        backgroundColor: const Color(0xFF43c6ac),
      ),
      body: Column(
        children: [
          // Date Picker Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedDate != null
                      ? 'Selected Date: ${DateFormat('MMM dd, yyyy').format(_selectedDate!)}'
                      : 'Select a Date',
                  style: const TextStyle(fontSize: 16),
                ),
                ElevatedButton(
                  onPressed: _pickDate,
                  child: const Text('Pick Date'),
                ),
              ],
            ),
          ),

          // Data Display Section
          Expanded(
            child: _selectedDate == null
                ? const Center(
                    child: Text('Please select a date to view reports.'),
                  )
                : StreamBuilder(
                    stream: _getFilteredCheckIns(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(
                          child: Text('No students checked in on this date.'),
                        );
                      }

                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var studentData = snapshot.data!.docs[index];

                          // Safely handling null value for studentName
                          var studentName =
                              studentData['studentName'] ?? 'Unknown Student';

                          // Safely handling the checkInTime field
                          Timestamp checkInTimestamp =
                              studentData['checkInTime'];
                          var checkInTime = checkInTimestamp.toDate();

                          return ListTile(
                            title: Text(studentName),
                            subtitle: Text(
                                'Checked in at: ${DateFormat('hh:mm a, MMM dd').format(checkInTime)}'),
                            leading: const Icon(Icons.check_circle,
                                color: Colors.green),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // Function to get filtered data
  Stream<QuerySnapshot> _getFilteredCheckIns() {
    if (_selectedDate == null) {
      return Stream.empty();
    }

    // Define start and end of the selected date
    final startOfDay = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
    );

    final endOfDay = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      23,
      59,
      59,
    );

    // Query Firestore for check-ins within this range
    return FirebaseFirestore.instance
        .collection('checkInHistory')
        .where('checkInTime',
            isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
        .where('checkInTime', isLessThanOrEqualTo: Timestamp.fromDate(endOfDay))
        .snapshots();
  }

  // Function to pick a date
  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}

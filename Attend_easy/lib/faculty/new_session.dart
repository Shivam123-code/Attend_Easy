import 'package:flutter/material.dart';

class NewSession extends StatefulWidget {
  const NewSession({super.key});

  @override
  State<NewSession> createState() => _NewSessionState();
}

class _NewSessionState extends State<NewSession> {
  final List<String> _dropDownItems = ['B.Tech', 'M.Tech', 'MBA', 'BBA', 'BCA'];
  String _selectedItem = "B.Tech";
  final String _selectedTextFieldItem = 'B.Tech';
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      bool isDesktop = Constraints.maxWidth > 600;
      double screenWidth = Constraints.maxWidth;
      double screenHeight = Constraints.maxHeight;
      return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: screenWidth * 1.0,
              height: screenHeight * 1.0,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 50,
                    margin: const EdgeInsets.only(top: 70),
                    child: const Text(
                      'New Attendance Session',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 50,
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      'Course',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: screenWidth * (isDesktop ? 0.6 : 0.85),
                  // ),
                  SizedBox(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 60,
                    child: Center(
                      child: Column(
                        children: [
                          DropdownButtonFormField(
                            value: _selectedItem,
                            items: _dropDownItems.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _selectedItem = value!;
                              });
                            },
                            icon: const Icon(Icons.arrow_drop_down),
                            decoration: InputDecoration(
                              hintText: ' Select Courses',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Container(
                  //   width: screenWidth * (isDesktop ? 0.6 : 0.85),
                  //   height: 50,
                  //   margin: EdgeInsets.only(top: 10),
                  //   child: Text(
                  //     'Date',
                  //     style: TextStyle(
                  //       fontSize: 20,
                  //       color: Colors.black,
                  //       fontFamily: 'DM Sans',
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 50,
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      'Venue',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  //margin: EdgeInsets.only(left: 45),
                  SizedBox(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 60,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: ' Enter attendance venue',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Container(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 50,
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      'Geolocation Radius',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  SizedBox(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 60,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: ' Enter raduis in meter',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 50,
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      'Code Duration',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ), //margin: EdgeInsets.only(left: 45),
                  SizedBox(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 60,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: ' Enter duration in minutes',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),

                  // child: ElevatedButton(
                  //   onPressed: () {},
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: const Color(0xFF1DC99E),
                  //     foregroundColor: Colors.white,
                  //   ),
                  //   child: const Text(
                  //     'Generate Session Code',
                  //     style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: screenWidth * (isDesktop ? 0.6 : 0.85),
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Center(
                            child: Text(
                              '123456',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter'),
                            ),
                          ),
                          content: const Text(
                            'This code will expire in the next 10 minutes',
                            style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Inter'),
                              ),
                            ),
                            ElevatedButton(
                              //onPressed: () => Navigator.pop(context, 'Start'),
                              onPressed: () {},
                              child: const Text(
                                'Start',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Inter'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1DC99E),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Generate Session Code',
                        style: TextStyle(fontSize: 20, fontFamily: 'Inter'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

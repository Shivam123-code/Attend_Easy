// import 'package:attend_easy/admin/AttendancePage.dart';
// import 'package:attend_easy/admin/DashboardPage.dart';
// import 'package:attend_easy/admin/UserManagementPage.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(AdminPanelApp());
// }

// class AdminPanelApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Admin Panel',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: AdminPanel(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class AdminPanel extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         // Determine layout type based on screen width
//         bool isMobile = constraints.maxWidth < 600;

//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('Admin Panel'),
//           ),
//           drawer: isMobile ? _buildDrawer(context) : null,
//           body: Row(
//             children: [
//               if (!isMobile)
//                 SizedBox(
//                   width: 200,
//                   child: _buildDrawer(context, isSideNav: true),
//                 ),
//               Expanded(
//                 child: _getPage(), // Default page content
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildDrawer(BuildContext context, {bool isSideNav = false}) {
//     return Container(
//       color: isSideNav ? Colors.grey[200] : null,
//       child: Drawer(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             DrawerHeader(
//               decoration: const BoxDecoration(color: Colors.blue),
//               child: const Text(
//                 'Admin Menu',
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.dashboard),
//               title: const Text('Dashboard'),
//               onTap: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (_) => DashboardPage()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.people),
//               title: const Text('User Management'),
//               onTap: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (_) => UserManagementPage()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.list_alt),
//               title: const Text('Attendance Overview'),
//               onTap: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (_) => AttendancePage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _getPage() {
//     // You can replace this with logic to show the current active page.
//     return DashboardPage(); // Default to DashboardPage for now.
//   }
// }

import 'package:flutter/material.dart';
import 'package:attend_easy/admin/DashboardPage.dart';
import 'package:attend_easy/admin/UserManagementPage.dart';
import 'package:attend_easy/admin/AttendancePage.dart';

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine whether the screen is large or small (desktop or mobile)
        bool isDesktop = constraints.maxWidth > 600;
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Admin Panel'),
          ),
          body: Row(
            children: [
              if (isDesktop)
                Container(
                  width: screenWidth * 0.2,
                  color: Colors.grey[200],
                  child: _buildSideNav(context, screenHeight),
                ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: DashboardPage(), // Default page for now
                ),
              ),
            ],
          ),
          drawer: isDesktop
              ? null
              : Drawer(child: _buildSideNav(context, screenHeight)),
        );
      },
    );
  }

  Widget _buildSideNav(BuildContext context, double screenHeight) {
    return Column(
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.blue),
          child: const Text(
            'Admin Menu',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.dashboard),
          title: const Text('Dashboard'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => DashboardPage()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.people),
          title: const Text('User Management'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => UserManagementPage()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.list_alt),
          title: const Text('Attendance Overview'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => AttendancePage()),
            );
          },
        ),
      ],
    );
  }
}

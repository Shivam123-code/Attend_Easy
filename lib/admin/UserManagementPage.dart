import 'package:flutter/material.dart';

void main() {
  runApp(UserManagementPage());
}

class UserManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Management')),
      body: ListView(
        children: List.generate(
          10,
          (index) => ListTile(
            title: Text('User $index'),
            subtitle: Text('Role: Student'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Add user logic
        },
      ),
    );
  }
}

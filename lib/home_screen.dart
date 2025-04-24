import 'package:flutter/material.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final String name;
  final String designation;
  final Function(String, String) updateProfile;

  const HomeScreen({
    required this.toggleTheme,
    required this.name,
    required this.designation,
    required this.updateProfile,
    Key? key,
  }) : super(key: key);

  void _navigateToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProfileScreen(
          name: name,
          designation: designation,
          updateProfile: updateProfile,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${name.isEmpty ? "Guest" : name}!',
                style: TextStyle(fontSize: 20)),
            if (designation.isNotEmpty)
              Text('$designation'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToProfile(context),
              child: Text('Go to Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
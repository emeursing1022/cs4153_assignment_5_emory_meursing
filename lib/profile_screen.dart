import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String name;
  final String designation;
  final Function(String, String) updateProfile;

  const ProfileScreen({
    required this.name,
    required this.designation,
    required this.updateProfile,
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController jobController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    jobController = TextEditingController(text: widget.designation);
  }

  @override
  void dispose() {
    nameController.dispose();
    jobController.dispose();
    super.dispose();
  }

  void saveProfile() {
    String name = nameController.text.trim();
    String job = jobController.text.trim();
    if (name.isEmpty || job.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }
    widget.updateProfile(name, job);
    Navigator.pop(context); // Go back to HomeScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Profile')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: jobController,
              decoration: InputDecoration(
                labelText: 'Job Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: saveProfile,
              child: Text('Save Profile'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
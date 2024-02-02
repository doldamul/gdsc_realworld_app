import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String bio;

  ProfilePage({
    super.key,
    this.name = 'N/A',
    this.bio = 'N/A',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Username'),
            Text(
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 20,
              ),
              name,
            ),
            SizedBox(height: 10),
            const Text('Bio'),
            Text(
              style: TextStyle(
                color: Colors.deepPurple,
              ),
              bio,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const ProfileScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['fullname'] ?? 'Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nickname: ${data['nickname'] ?? 'N/A'}'),
            Text('Fullname: ${data['fullname'] ?? 'N/A'}'),
            Text('Blood Type: ${data['blood type'] ?? 'N/A'}'),
            Text('Donations: ${data['donations'] ?? 'N/A'}'),
            Text('Age: ${data['age'] ?? 'N/A'}'),
            Text('Last Donation: ${data['last donation'] ?? 'N/A'}'),
            Text('Address: ${data['address'] ?? 'N/A'}'),
            Text('Phone: ${data['phone'] ?? 'N/A'}'),
            Text('Email: ${data['email'] ?? 'N/A'}'),
            Text('Rank: ${data['rank'] ?? 'N/A'}'),
          ],
        ),
      ),
    );
  }
}

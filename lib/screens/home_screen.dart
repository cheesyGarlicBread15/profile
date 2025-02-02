import 'package:flutter/material.dart';
import 'package:profile/buttons/profile_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<Map<String, dynamic>> profiles = [
    {
      'nickname': 'JohnDoe',
      'fullname': 'John Doe',
      'blood type': 'O+',
      'donations': 5,
      'age': 29,
      'last donation': '2024-01-15',
      'address': '123 Elm Street, Springfield, IL',
      'phone': '+1 555-123-4567',
      'email': 'johndoe@email.com',
      'rank': 'Donor Ambassador',
    },
    {
      'nickname': 'JaneSmith',
      'fullname': 'Jane Smith',
      'blood type': 'A-',
      'donations': 3,
      'age': 34,
      'last donation': '2023-12-05',
      'address': '456 Oak Avenue, Madison, WI',
      'phone': '+1 555-987-6543',
      'email': 'janesmith@email.com',
      'rank': 'Regular Donor',
    },
    {
      'nickname': 'Mike77',
      'fullname': 'Mike Johnson',
      'blood type': 'B+',
      'donations': 8,
      'age': 41,
      'last donation': '2024-02-01',
      'address': '789 Pine Road, Chicago, IL',
      'phone': '+1 555-555-7890',
      'email': 'mikejohnson@email.com',
      'rank': 'Top Donor',
    },
    {
      'nickname': 'Sarah_91',
      'fullname': 'Sarah Lee',
      'blood type': 'AB-',
      'donations': 2,
      'age': 28,
      'last donation': '2023-11-18',
      'address': '321 Maple Drive, Peoria, IL',
      'phone': '+1 555-321-4321',
      'email': 'sarahlee@email.com',
      'rank': 'Occasional Donor',
    },
    {
      'nickname': 'Tommy99',
      'fullname': 'Tommy Turner',
      'blood type': 'O-',
      'donations': 6,
      'age': 39,
      'last donation': '2024-01-22',
      'address': '654 Birch Boulevard, Rockford, IL',
      'phone': '+1 555-222-3456',
      'email': 'tommyturner@email.com',
      'rank': 'Donor Leader',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profiles'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...profiles.map((profile) {
                return ProfileButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile', arguments: profile);
                  },
                  text: profile['nickname'],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

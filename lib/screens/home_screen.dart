import 'package:flutter/material.dart';
import 'package:profile/buttons/profile_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<Map<String, dynamic>> profiles = [
    {
      'profile': 'paul.jpg',
      'nickname': 'pj',
      'fullname': 'Paul Julius Labrador',
      'blood type': 'B-',
      'donations': 5,
      'age': 29,
      'last donation': 'January 15, 2024',
      'address': '123 Elm Street, Springfield, IL',
      'phone': '+1 555-123-4567',
      'email': 'jakult69@email.com',
      'rank': 'Donor Ambassador',
    },
    {
      'profile': 'jibril.jpg',
      'nickname': 'Jiru',
      'fullname': 'Jibril Leandear Paul Rubi',
      'blood type': 'A-',
      'donations': 3,
      'age': 34,
      'last donation': 'December 5, 2023',
      'address': '456 Oak Avenue, Madison, WI',
      'phone': '+1 555-987-6543',
      'email': 'jlprui@email.com',
      'rank': 'Regular Donor',
    },
    {
      'profile': 'prof.jpg',
      'nickname': 'GarlicBread',
      'fullname': 'Daven Alajid',
      'blood type': 'O+',
      'donations': 1,
      'age': 22,
      'last donation': 'October 19, 2024',
      'address': '789 Pine Road, Chicago, IL',
      'phone': '+1 555-555-7890',
      'email': 'dabon@email.com',
      'rank': 'Top Donor',
    },
    {
      'profile': 'sayson.jpg',
      'nickname': 'cutiepie',
      'fullname': 'Davin Klein Sayson',
      'blood type': 'AB-',
      'donations': 2,
      'age': 28,
      'last donation': 'November 18, 2023',
      'address': '321 Maple Drive, Peoria, IL',
      'phone': '+1 555-321-4321',
      'email': 'princess0_0@email.com',
      'rank': 'Occasional Donor',
    },
    {
      'profile': 'zeldrex.jpg',
      'nickname': 'Splakoy',
      'fullname': 'Zeldrex June Inso',
      'blood type': 'O-',
      'donations': 6,
      'age': 39,
      'last donation': 'January 22, 2024',
      'address': '654 Birch Boulevard, Rockford, IL',
      'phone': '+1 555-222-3456',
      'email': 'TotalShell@email.com',
      'rank': 'Donor Leader',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profiles'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Profiles',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text('Home'),
              onTap: () => Navigator.pushNamed(context, '/home'),
            ),
            ...profiles.map((profile) {
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(profile['nickname']),
                onTap: () {
                  Navigator.pushNamed(context, '/profile',
                      arguments: profile);
                },
              );
            }),
          ],
        ),
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
                    Navigator.pushNamed(context, '/profile',
                        arguments: profile);
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

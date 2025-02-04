import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const ProfileScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = 170;
    final double profileHeight = 140;
    final double top = appBarHeight - (profileHeight / 2);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                color: const Color(0xFFFF5757),
                height: appBarHeight,
                width: double.infinity,
              ),
              Positioned(
                bottom: 10,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white, width: 3),
                        iconColor: Colors.white,
                        minimumSize: const Size(0, 30),
                      ),
                      label: const Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      icon: const Icon(Icons.edit, size: 15),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data['nickname'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.verified,
                          color: Color.fromARGB(255, 32, 236, 39),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: top,
                right: 30,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 6)),
                  child: CircleAvatar(
                    radius: profileHeight / 2,
                    backgroundImage: const AssetImage('assets/images/prof.jpg'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // FIXME: top padding bugged because of appbar preferred size
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

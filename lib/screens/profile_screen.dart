import 'package:flutter/material.dart';
import 'package:profile/custom_appbar.dart';
import 'package:profile/texts/profile_field.dart';
import 'package:profile/profiles.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const ProfileScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    int currentIndex =
        profiles.indexWhere((p) => p['nickname'] == data['nickname']);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile'),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: const Color(0xFFFF5757),
                  height: 170,
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
                  top: 170 - (140 / 2),
                  right: 30,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 6)),
                    child: CircleAvatar(
                        radius: 140 / 2,
                        backgroundImage: AssetImage(
                            'assets/images/profiles/${data["profile"]}')),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1st Section - Basic Profile Info
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileField(
                              fieldName: 'Full Name:', data: data['fullname']),
                          const SizedBox(height: 20),
                          ProfileField(
                              fieldName: 'Blood Type:',
                              data: data['blood type']),
                          const SizedBox(height: 20),
                          ProfileField(
                              fieldName: 'Age:', data: data['age'].toString()),
                        ],
                      ),
                      const SizedBox(
                          width: 40), // Added spacing between columns
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileField(
                              fieldName: 'Donations:',
                              data: data['donations'].toString()),
                          const SizedBox(height: 20),
                          ProfileField(
                              fieldName: 'Last Donation:',
                              data: data['last donation']),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Divider(color: Colors.black12, thickness: 1),
                  const SizedBox(height: 15),

                  // 2nd Section - Address & Contact
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileField(
                          fieldName: 'Address:', data: data['address']),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          ProfileField(
                              fieldName: 'Phone:', data: data['phone']),
                          const SizedBox(width: 20),
                          ProfileField(
                              fieldName: 'Email:', data: data['email']),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Divider(color: Colors.black12, thickness: 1),
                  const SizedBox(height: 15),

                  // 3rd Section - Rank & Medal
                  const Text(
                    'Your Current Rank',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(data['rank']),
                  Center(
                    child: Image.asset(
                      'assets/images/medals/${data['rank'].toLowerCase().replaceAll(" ", "_")}.png',
                      width: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Navigation Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (currentIndex > 0)
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(
                                    data: profiles[currentIndex - 1]),
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_back),
                          label: const Text("Previous"),
                        ),
                      if (currentIndex < profiles.length - 1)
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(
                                    data: profiles[currentIndex + 1]),
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text("Next"),
                        ),
                    ],
                  ),
                  const Text(
                    'Other Profiles',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: profiles
                        .where((profile) => profile['id'] != data['id'])
                        .map((profile) {
                      return ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProfileScreen(data: profile),
                            ),
                          );
                        },
                        child: Text(profile['nickname']),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

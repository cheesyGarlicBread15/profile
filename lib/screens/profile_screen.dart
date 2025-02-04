import 'package:flutter/material.dart';
import 'package:profile/texts/profile_field.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const ProfileScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    const double appBarHeight = 170;
    const double profileHeight = 140;
    const double top = appBarHeight - (profileHeight / 2);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appBarHeight),
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
                  child: const CircleAvatar(
                    radius: profileHeight / 2,
                    backgroundImage: AssetImage('assets/images/prof.jpg'),
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
            // 1st section
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileField(
                        fieldName: 'Full Name:', data: data['fullname']),
                    const SizedBox(
                      height: 20,
                    ),
                    ProfileField(
                        fieldName: 'Blood Type:', data: data['blood type']),
                    const SizedBox(
                      height: 20,
                    ),
                    ProfileField(
                        fieldName: 'Age:', data: data['age'].toString()),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileField(
                        fieldName: 'Donations:',
                        data: data['donations'].toString()),
                    const SizedBox(
                      height: 20,
                    ),
                    ProfileField(
                        fieldName: 'Last Donation:',
                        data: data['last donation']),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Colors.black12,
              thickness: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            // 2nd section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProfileField(fieldName: 'Address:', data: data['address'])
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProfileField(fieldName: 'Phone:', data: data['phone']),
                    const SizedBox(
                      width: 20,
                    ),
                    ProfileField(fieldName: 'Email:', data: data['email'])
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Colors.black12,
              thickness: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            // 3rd section
            const Text(
              'Your Current Rank',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(data['rank']),
          ],
        ),
      ),
    );
  }
}

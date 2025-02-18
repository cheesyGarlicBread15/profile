import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profile/custom_appbar.dart';
import 'package:profile/custom_widgets/profile_field.dart';
import 'package:profile/models/profile_model.dart';

class ProfileScreen extends StatelessWidget {
  final Future<List<ProfileModel>> profiles;
  final ProfileModel selectedProfile;
  const ProfileScreen(
      {super.key, required this.profiles, required this.selectedProfile});

  Future<int> getCurrentIndex() async {
    final profilesList = await profiles;
    return profilesList.indexWhere((p) => p.id == selectedProfile.id);
  }

  String getRank(String rank) {
    switch (rank) {
      case 'ambassador':
        return 'Donor Ambassador';
      case 'leader':
        return 'Donor Leader';
      case 'occassional':
        return 'Occassional Donor';
      case 'regular':
        return 'Regular Donor';
      case 'top':
        return 'Top Donor';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    String formatTimestamp(Timestamp timestamp) {
      // Convert Timestamp to DateTime
      DateTime dateTime = timestamp.toDate();

      // Format the DateTime as "Month Day, Year"
      String formattedDate = DateFormat('MMMM d, yyyy').format(dateTime);

      return formattedDate;
    }

    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile'),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: FutureBuilder<int>(
            future: getCurrentIndex(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }

              return Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        color: Theme.of(context).appBarTheme.backgroundColor,
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
                                side: const BorderSide(
                                    color: Colors.white, width: 3),
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
                                  selectedProfile.firstName,
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
                              border:
                                  Border.all(color: Colors.white, width: 6)),
                          child: CircleAvatar(
                            radius: 140 / 2,
                            backgroundImage: selectedProfile.img == null
                                ? const AssetImage(
                                    'assets/images/profiles/profile_default.jpg')
                                : NetworkImage(selectedProfile.img!),
                            onBackgroundImageError: (exception, stackTrace) {
                              print('Error loading image: $exception');
                            },
                          ),
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
                                    fieldName: 'Full Name:',
                                    data:
                                        '${selectedProfile.firstName} ${selectedProfile.lastName}'),
                                const SizedBox(height: 20),
                                ProfileField(
                                    fieldName: 'Blood Type:',
                                    data: selectedProfile.bloodType),
                                const SizedBox(height: 20),
                                ProfileField(
                                    fieldName: 'Age:',
                                    data: selectedProfile.age.toString()),
                              ],
                            ),
                            const SizedBox(width: 40),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProfileField(
                                    fieldName: 'Donations:',
                                    data: selectedProfile.donations.toString()),
                                const SizedBox(height: 20),
                                ProfileField(
                                    fieldName: 'Last Donation:',
                                    data: formatTimestamp(
                                        selectedProfile.lastDonation!)),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 15,),
                        // Navigation Buttons
                        FutureBuilder<List<ProfileModel>>(
                          future: profiles,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return const SizedBox();

                            final profilesList = snapshot.data!;
                            final currentIndex = profilesList
                                .indexWhere((p) => p.id == selectedProfile.id);

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Previous Button
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFFF5757)),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      bottomLeft: Radius.circular(4),
                                    ),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.chevron_left),
                                    onPressed: currentIndex > 0
                                        ? () {
                                            Navigator.pushReplacementNamed(
                                              context,
                                              '/profile',
                                              arguments: {
                                                'profile': profilesList[
                                                    currentIndex - 1],
                                                'profiles': profiles,
                                              },
                                            );
                                          }
                                        : null,
                                    color: currentIndex > 0
                                        ? const Color(0xFFFF5757)
                                        : Colors.grey,
                                  ),
                                ),
                                // Page Number
                                Container(
                                  decoration: const BoxDecoration(
                                    border: Border.symmetric(
                                      horizontal:
                                          BorderSide(color: Color(0xFFFF5757)),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Text(
                                    '${currentIndex + 1} / ${profilesList.length}',
                                    style: const TextStyle(
                                      color: Color(0xFFFF5757),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                // Next Button
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFFF5757)),
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(4),
                                      bottomRight: Radius.circular(4),
                                    ),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.chevron_right),
                                    onPressed:
                                        currentIndex < profilesList.length - 1
                                            ? () {
                                                Navigator.pushReplacementNamed(
                                                  context,
                                                  '/profile',
                                                  arguments: {
                                                    'profile': profilesList[
                                                        currentIndex + 1],
                                                    'profiles': profiles,
                                                  },
                                                );
                                              }
                                            : null,
                                    color:
                                        currentIndex < profilesList.length - 1
                                            ? const Color(0xFFFF5757)
                                            : Colors.grey,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        const Divider(color: Colors.black12, thickness: 1),
                        const SizedBox(height: 15),
                        // 2nd Section - Rank & Medal
                        const Text(
                          'Your Current Rank',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(getRank(selectedProfile.rank)),
                        Center(
                          child: Image.asset(
                            'assets/images/medals/${selectedProfile.rank}.png',
                            width: 200,
                            fit: BoxFit.contain,
                          ),
                        ),
                        // Other profiles
                        const SizedBox(height: 30),
                        const Divider(color: Colors.black12, thickness: 1),
                        const SizedBox(height: 15),
                        const Text(
                          'Other Donors',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 100,
                          child: FutureBuilder<List<ProfileModel>>(
                            future: profiles,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              final otherProfiles = snapshot.data!
                                  .where((profile) =>
                                      profile.id != selectedProfile.id)
                                  .toList();

                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: otherProfiles.length,
                                itemBuilder: (context, index) {
                                  final profile = otherProfiles[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          '/profile',
                                          arguments: {
                                            'profile': profile,
                                            'profiles': profiles,
                                          },
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundImage: profile.img == null
                                                ? const AssetImage(
                                                    'assets/images/profiles/profile_default.jpg')
                                                : NetworkImage(profile.img!)
                                                    as ImageProvider,
                                            onBackgroundImageError:
                                                (exception, stackTrace) {
                                              print(
                                                  'Error loading image: $exception');
                                            },
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            profile.firstName,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

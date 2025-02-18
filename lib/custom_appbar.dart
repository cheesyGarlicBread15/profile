import 'package:flutter/material.dart';
import 'package:profile/models/profile_model.dart';
import 'package:profile/repositories/profile_repository.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late Future<List<ProfileModel>> profiles;

  @override
  void initState() {
    super.initState();
    print('drawer initstaet');
    profiles = ProfileRepository().getAllProfiles();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFFF5757),
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
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          ExpansionTile(
            leading: const Icon(Icons.people),
            title: const Text('Profiles'),
            children: [
              FutureBuilder<List<ProfileModel>>(
                future: profiles,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return ListTile(
                      title: Text("Error: ${snapshot.error}"),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const ListTile(
                      title: Text("No profiles available"),
                    );
                  } else {
                    return Column(
                      children: snapshot.data!.map((profile) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(profile.lastName),
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
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

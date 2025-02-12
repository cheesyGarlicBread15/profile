import 'package:flutter/material.dart';
import 'package:profile/buttons/profile_button.dart';
import 'package:profile/custom_appbar.dart';
import 'package:profile/profiles.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Home'),
      drawer: const CustomDrawer(),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ...profiles.map((profile) {
              //   return ProfileButton(
              //     onPressed: () {
              //       Navigator.pushNamed(context, '/profile',
              //           arguments: profile);
              //     },
              //     text: profile['nickname'],
              //   );
              // })
            ],
          ),
        ),
      ),
    );
  }
}

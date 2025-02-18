import 'package:flutter/material.dart';
import 'package:profile/custom_widgets/primary_button.dart';
import 'package:profile/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              PrimaryButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/create_profile'),
                  text: 'Create Profile'),
            ],
          ),
        ),
      ),
    );
  }
}

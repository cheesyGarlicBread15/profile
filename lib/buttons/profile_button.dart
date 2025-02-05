import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const ProfileButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    // TODO: stylize buttons
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text)),
    );
  }
}

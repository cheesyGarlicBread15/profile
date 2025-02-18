import 'package:flutter/material.dart';

class ProfileField extends StatelessWidget {
  final String fieldName, data;
  const ProfileField({super.key, required this.fieldName, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: const TextStyle(color: Colors.black45, fontSize: 10),
        ),
        Text(data,),
      ],
    );
  }
}

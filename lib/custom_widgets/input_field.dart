import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType type;
  final List<TextInputFormatter>? inputFormatters;
  
  const InputField(
      {super.key,
      required this.controller,
      required this.icon,
      required this.label,
      required this.type,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      inputFormatters: inputFormatters ?? [],
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFFFF5757)), // Red icons
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      validator: (value) => value!.isEmpty ? 'Enter your $label' : null,
    );
  }
}

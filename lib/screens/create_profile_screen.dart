import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:profile/custom_widgets/input_field.dart';
import 'package:profile/custom_widgets/primary_button.dart';
import 'package:profile/custom_widgets/secondary_button.dart';
import 'package:profile/data/blood_types.dart';
import 'package:profile/data/rank.dart';
import 'package:profile/models/profile_model.dart';
import 'package:profile/repositories/profile_repository.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _imgController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _donationsController = TextEditingController();

  String? selectedBloodType, selectedRank;
  DateTime? selectedDate;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String img = _imgController.text;
      String firstName = _firstnameController.text;
      String lastName = _lastnameController.text;
      int age = int.parse(_ageController.text);
      int donations = int.parse(_donationsController.text);

      ProfileModel newProfile = ProfileModel(
          img: img,
          firstName: firstName,
          lastName: lastName,
          age: age,
          bloodType: selectedBloodType!,
          donations: donations,
          lastDonation: Timestamp.fromDate(selectedDate!),
          rank: selectedRank!);

      ProfileRepository().createProfile(newProfile);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Profile')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                InputField(
                  controller: _imgController,
                  label: 'Profile Picture',
                  icon: Icons.image,
                  type: TextInputType.text,
                ),
                // First Name
                const SizedBox(height: 15),
                InputField(
                  controller: _firstnameController,
                  label: 'First Name',
                  icon: Icons.person,
                  type: TextInputType.name,
                ),
                // Last Name
                const SizedBox(height: 15),
                InputField(
                  controller: _lastnameController,
                  label: 'Last Name',
                  icon: Icons.badge,
                  type: TextInputType.name,
                ),
                // Age
                const SizedBox(height: 15),
                InputField(
                  controller: _ageController,
                  label: 'Age',
                  icon: Icons.cake,
                  type: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 15),
                // Blood Type
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Blood Type',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedBloodType, // Display selected value
                  hint: const Text(
                      'Select a Blood Type'), // Placeholder when no value is selected
                  items: bloodTypes.map((bloodType) {
                    return DropdownMenuItem<String>(
                      value: bloodType,
                      child: Text(bloodType),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedBloodType = value; // Update selected value
                    });
                  },
                ),
                const SizedBox(height: 15),
                // Donations
                InputField(
                  controller: _donationsController,
                  icon: Icons.volunteer_activism,
                  label: 'Donations',
                  type: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 15),
                // Last Donation
                SecondaryButton(
                    onPressed: () => _selectDate(context),
                    text: selectedDate != null
                        ? DateFormat('MMMM dd, yyyy').format(selectedDate!)
                        : 'Last Donation'),
                const SizedBox(height: 15),
                // Rank
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Rank',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedRank, // Display selected value
                  hint: const Text(
                      'Select a Rank'), // Placeholder when no value is selected
                  items: ranks.entries.map((rank) {
                    return DropdownMenuItem<String>(
                      value: rank.key,
                      child: Text(rank.value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRank = value; // Update selected value
                    });
                  },
                ),
                const SizedBox(height: 30),
                // FIXME: validation not working properly
                // Submit
                PrimaryButton(
                    onPressed: () {
                      _submitForm();
                      Navigator.pop(context);
                    },
                    text: 'Submit'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

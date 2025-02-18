import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/models/profile_model.dart';

class ProfileRepository extends GetxController {
  static ProfileRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createProfile(ProfileModel profileModel) async {
    await _db
        .collection('Profiles')
        .add(profileModel.toJsonForCreate())
        .whenComplete(() {
          Get.snackbar(
            'Success',
            'Profile created successfully.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          );
        })
        .catchError((errror, stackTrace) {
      Get.snackbar(
        'Error',
        'Something went wrong.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      print(errror.toString());
    });
  }

  Future<List<ProfileModel>> getAllProfiles() async {
    final snapshot = await _db.collection('Profiles').orderBy('last_name').get();
    final profiles = snapshot.docs.map((p) => ProfileModel.toModel(p)).toList();
    return profiles;
  }
}

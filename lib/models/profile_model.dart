import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  final String? id, img;
  final Timestamp? createdAt, lastDonation;
  final String firstName, lastName, bloodType, rank;
  final int age, donations;

  const ProfileModel({
    this.id,
    this.img,
    this.createdAt,
    required this.firstName,
    required this.lastName,
    required this.bloodType,
    required this.lastDonation,
    required this.rank,
    required this.age,
    required this.donations,
  });

  /// for creating profiles
  toJsonForCreate() {
    // actual key-value pairs to be stored
    return {
      'img': img ?? '',
      'first_name': firstName,
      'last_name': lastName,
      'blood_type': bloodType,
      'last_donation': lastDonation,
      'rank': rank,
      'age': age,
      'donations': donations,
      'created_at': Timestamp.now(),
    };
  }

  toJsonForRead() {
    return {
      'id': id,
      'img': img,
      'first_name': firstName,
      'last_name': lastName,
      'blood_type': bloodType,
      'last_donation': lastDonation,
      'rank': rank,
      'age': age,
      'donations': donations,
      'created_at': createdAt,
    };
  }

  factory ProfileModel.toModel(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return ProfileModel(
        id: document.id,
        img: data!['img'],
        firstName: data['first_name'],
        lastName: data['last_name'],
        bloodType: data['blood_type'],
        lastDonation: data['last_donation'],
        rank: data['rank'],
        age: data['age'],
        donations: data['donations'],
        createdAt: data['created_at']);
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../models/profile.dart';

class ProfileProvider extends ChangeNotifier {
  Profile _profile = Profile(
    name: 'John Doe',
    role: 'Student',
    email: 'john.doe@example.com',
    phoneNumber: '123-456-7890',
    imageUrl: 'https://via.placeholder.com/150',
  );

  Profile get profile => _profile;

  void updateProfile({
    String? name,
    String? role,
    String? email,
    String? phoneNumber,
    String? imageUrl,
  }) {
    _profile = _profile.copyWith(
      name: name,
      role: role,
      email: email,
      phoneNumber: phoneNumber,
      imageUrl: imageUrl,
    );
    notifyListeners();
  }

  Future<void> updateProfileImage(File imageFile) async {
    try {
      // In a real app, you would upload this to a server
      // For this demo, we'll save it locally and use the file path
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = path.basename(imageFile.path);
      final savedImage = await imageFile.copy('${appDir.path}/$fileName');
      
      updateProfile(imageUrl: savedImage.path);
    } catch (e) {
      debugPrint('Error updating profile image: $e');
    }
  }
}


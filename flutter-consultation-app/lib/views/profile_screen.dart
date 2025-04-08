import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import 'widgets/profile_widgets.dart';
import 'widgets/common_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile'),
      body: Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
          final profile = profileProvider.profile;
          
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  ProfileImage(
                    imageUrl: profile.imageUrl,
                    radius: 60,
                    showEditButton: true,
                    onEditPressed: () {
                      ImagePickerHelper.showImagePickerOptions(
                        context,
                        (imageFile) async {
                          await profileProvider.updateProfileImage(imageFile);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Profile image updated successfully'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Text(
                    profile.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    profile.role,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 32),
                  InfoCard(
                    items: [
                      InfoItem(
                        icon: Icons.email,
                        label: 'Email',
                        value: profile.email,
                      ),
                      InfoItem(
                        icon: Icons.phone,
                        label: 'Phone',
                        value: profile.phoneNumber,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => ProfileEditDialog(profile: profile),
                      );
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Update Profile'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


import 'package:flutter/material.dart';
import '../views/home_screen.dart';
import '../views/profile_details_screen.dart';
import '../views/add_consultation_screen.dart';
import '../views/consultation_detail_screen.dart';
import '../main.dart';

class AppRoutes {
  // Route names
  static const String main = '/';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String addConsultation = '/add-consultation';
  static const String consultationDetail = '/consultation-detail';

  // Route generator
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case addConsultation:
        return MaterialPageRoute(builder: (_) => const AddConsultationScreen());
      case consultationDetail:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ConsultationDetailScreen(
            consultationId: args['consultationId'],
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  // Navigation helper methods
  static void navigateToHome(BuildContext context) {
    Navigator.pushNamed(context, home);
  }

  static void navigateToProfile(BuildContext context) {
    Navigator.pushNamed(context, profile);
  }

  static void navigateToAddConsultation(BuildContext context) {
    Navigator.pushNamed(context, addConsultation);
  }

  static void navigateToConsultationDetail(BuildContext context, String consultationId) {
    Navigator.pushNamed(
      context,
      consultationDetail,
      arguments: {'consultationId': consultationId},
    );
  }
}


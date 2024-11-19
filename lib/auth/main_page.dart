import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ct484_project/auth/auth_page.dart';
import 'package:ct484_project/view/home/home_view.dart';

// ignore: camel_case_types
class Main_Page extends StatelessWidget {
  const Main_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance
            .authStateChanges(), // Listen for auth state changes
        builder: (context, snapshot) {
          // If waiting for authentication status to load
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // If error occurs
          if (snapshot.hasError) {
            return Center(
                child: Text('Something went wrong: ${snapshot.error}'));
          }

          // If user is logged in
          if (snapshot.hasData) {
            return const HomeView(); // Show home page if logged in
          } else {
            return const Auth_Page(); // Show login/signup page if not logged in
          }
        },
      ),
    );
  }
}

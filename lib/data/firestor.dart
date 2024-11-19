import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ct484_project/models/tasks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:ct484_project/models/profileuser.dart';

// import 'package:flutter_to_do_list/model/notes_model.dart';

// ignore: camel_case_types
class Firestore_Datasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ignore: non_constant_identifier_names
  Future<bool> CreateUser(String email) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set({"id": _auth.currentUser!.uid, "email": email});
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  // Add a new task (note) to Firestore
  Future<bool> addTasks(
      String subtitle, String title, DateTime? date, DateTime? time) async {
    try {
      var uuid = Uuid().v4();
      DateTime data = DateTime.now();
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('taskss')
          .doc(uuid)
          .set({
        'id': uuid,
        'subtitle': subtitle,
        'isDon': false,
        'title': title,
        'createdAtTime': data.toIso8601String(),
        'createdAtDate': data.toIso8601String(),
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Get tasks from Firestore and return them as a list
  List<Taskss> getTasks(AsyncSnapshot snapshot) {
    try {
      final tasksList = snapshot.data!.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Taskss(
          data['id'],
          data['subtitle'],
          data['title'],
          DateTime.parse(data['createdAtTime']),
          DateTime.parse(data['createdAtDate']),
          data['isDon'],
        );
      }).toList();
      return tasksList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  // Stream of tasks based on their completion status
  Stream<QuerySnapshot> stream(bool isDone) {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('taskss')
        .where('isDon', isEqualTo: isDone)
        .snapshots();
  }

  // Mark a task as done or not done
  Future<bool> markAsDone(String uuid, bool isDone) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('taskss')
          .doc(uuid)
          .update({'isDon': isDone});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Update a task's details (subtitle, title, image)
  Future<void> updateTasks(String id, String? title, String? subtitle,
      DateTime? time, DateTime? date) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('taskss')
          .doc(id)
          .update({
        'title': title,
        'subtitle': subtitle,
        'createdAtTime': time?.toIso8601String(),
        'createdAtDate': date?.toIso8601String(),
      });
    } catch (e) {
      print("Error updating task: $e");
      throw Exception("Could not update task");
    }
  }

  Future<bool> deleteTasks(String uuid) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('taskss')
          .doc(uuid)
          .delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

// Create Profile
  Future<void> createProfile(Profile profile) async {
    try {
      String userId = _auth.currentUser!.uid;
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('profileuser')
          .doc('profile') // Tạo tài liệu với ID cố định 'profile'
          .set(profile.toMap());
      print("Profile created successfully.");
    } catch (e) {
      print("Error creating profile: $e");
      throw Exception("Could not create profile");
    }
  }

// Get Profile
  Future<Profile?> getProfile() async {
    try {
      String userId = _auth.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('profileuser')
          .doc('profile') // Tìm theo document có tên "profile"
          .get();

      if (snapshot.exists) {
        return Profile.fromMap(snapshot.data()!);
      } else {
        return null;
      }
    } catch (e) {
      print("Error getting profile: $e");
      return null;
    }
  }

// Update Profile
  Future<void> updateProfile(Profile profile) async {
    try {
      String userId = _auth.currentUser!.uid;
      final docRef = _firestore
          .collection('users')
          .doc(userId)
          .collection('profileuser')
          .doc('profile');

      final snapshot = await docRef.get();

      if (snapshot.exists) {
        // Nếu tài liệu đã tồn tại, cập nhật nó
        await docRef.update(profile.toMap());
        print("Profile updated successfully.");
      } else {
        // Nếu tài liệu chưa tồn tại, tạo mới
        await docRef.set(profile.toMap());
        print("Profile created successfully.");
      }
    } catch (e) {
      print("Error updating profile: $e");
      throw Exception("Could not update profile");
    }
  }
}

// Delete a task from Firestore
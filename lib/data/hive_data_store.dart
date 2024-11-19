// import 'package:ct484_project/models/profileuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import '../data/firestor.dart';

///
import '../models/task.dart';

class HiveDataStore {
  static const boxName = "tasksBox";
  final Box<Task> box = Hive.box<Task>(boxName);
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Add new Task
  Future<void> addTask({required Task task}) async {
    String userId = _auth.currentUser!.uid;
    await box.put(task.id, task);
    await firestore
        .collection('users') // Tạo document trong users/{userId}/taskss
        .doc(userId)
        .collection('taskss')
        .doc(task.id)
        .set({
      'title': task.title,
      'subtitle': task.subtitle,
      'createdAtTime': task.createdAtTime.toIso8601String(),
      'createdAtDate': task.createdAtDate.toIso8601String(),
      'isCompleted': task.isCompleted,
    });
  }

  /// Show task
  Future<Task?> getTask({required String id}) async {
    return box.get(id);
  }

  /// Update task
  Future<void> updateTask({required Task task}) async {
    String userId = _auth.currentUser!.uid; // Lấy userId từ FirebaseAuth
    await task.save(); // Update Hive
    await firestore
        .collection('users') // Cập nhật document trong users/{userId}/taskss
        .doc(userId)
        .collection('taskss')
        .doc(task.id)
        .update({
      'title': task.title,
      'subtitle': task.subtitle,
      'createdAtTime': task.createdAtTime.toIso8601String(),
      'createdAtDate': task.createdAtDate.toIso8601String(),
      'isCompleted': task.isCompleted,
    });
  }

  /// Delete task
  Future<void> dalateTask({required Task task}) async {
    await task.delete(); // Delete from
    String userId = _auth.currentUser!.uid;
    await firestore
        .collection('users')
        .doc(userId)
        .collection('taskss')
        .doc(task.id)
        .delete(); // Firebase
  }

  ValueListenable<Box<Task>> listenToTask() {
    return box.listenable();
  }

  Future<void> syncFromFirebase() async {
    final snapshot = await firestore.collection('tasks').get();
    for (var doc in snapshot.docs) {
      final data = doc.data();
      final task = Task(
        id: doc.id,
        title: data['title'] ?? '',
        subtitle: data['subtitle'] ?? '',
        createdAtTime: DateTime.parse(data['createdAtTime']),
        createdAtDate: DateTime.parse(data['createdAtDate']),
        isCompleted: data['isCompleted'] ?? false,
      );
      await box.put(task.id, task);
    }
  }
}

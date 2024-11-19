import 'package:firebase_auth/firebase_auth.dart';
import 'package:ct484_project/data/firestor.dart';

abstract class AuthenticationDatasource {
  // ignore: non_constant_identifier_names
  Future<void> register(String email, String password, String PasswordConfirm);
  Future<void> login(String email, String password);
}

class AuthenticationRemote extends AuthenticationDatasource {
  @override
  Future<void> login(String email, String password) async {
    try {
      // Attempt to sign in the user
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // Handling FirebaseAuthException specifically
      if (e.code == 'user-not-found') {
        throw 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        throw 'Incorrect password for that user.';
      } else {
        throw 'Login failed: ${e.message}';
      }
    } catch (e) {
      // For any other errors (not FirebaseAuthException)
      throw 'An unexpected error occurred: ${e.toString()}';
    }
  }

  @override
  Future<void> register(
      // ignore: non_constant_identifier_names
      String email,
      String password,
      // ignore: non_constant_identifier_names
      String PasswordConfirm) async {
    if (PasswordConfirm == password) {
      try {
        // Create the user in Firebase Authentication
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        )
            .then((value) {
          // Create the user in Firestore
          Firestore_Datasource().CreateUser(email);
        });
      } on FirebaseAuthException catch (e) {
        // Handling FirebaseAuthException during registration
        if (e.code == 'email-already-in-use') {
          throw 'The email address is already in use by another account.';
        } else {
          throw 'Registration failed: ${e.message}';
        }
      } catch (e) {
        // For any other errors (not FirebaseAuthException)
        throw 'An unexpected error occurred: ${e.toString()}';
      }
    } else {
      throw 'Passwords do not match'; // Show error if passwords do not match
    }
  }
}

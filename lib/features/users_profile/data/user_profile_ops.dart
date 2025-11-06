import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Handles all Supabase Storage operations.
/// Assumes the Supabase storage bucket is PUBLIC.
class StorageRepository {
  final SupabaseClient _supabase;
  final ImagePicker _picker = ImagePicker();

  StorageRepository({SupabaseClient? client})
      : _supabase = client ?? Supabase.instance.client;

  /// Picks an image from the user's gallery and uploads it
  /// to Supabase Storage under "profiles/{userId}/profile.jpg".
  /// Returns the public URL of the uploaded image.
  Future<String?> uploadProfileImage(String userId) async {
    try {
      // Pick image
      final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
      if (picked == null) return null; // user cancelled

      final file = File(picked.path);
      final path = 'profiles/$userId/profile.jpg';

      // Upload (overwrite if already exists)
      await _supabase.storage.from('users_profile_pictures').upload(
        path,
        file,
        fileOptions: const FileOptions(upsert: true),
      );

      // Generate public URL
      final publicUrl =
      _supabase.storage.from('users_profile_pictures').getPublicUrl(path);

      print('✅ Uploaded: $publicUrl');
      return publicUrl;
    } catch (e) {
      print('❌ Upload failed: $e');
      return null;
    }
  }

  //https://zihalociciionwkhgoha.supabase.co/storage/v1/object/public/users_profile_pictures/profiles/Oo5BZVKjqVfQ0qTcd9lr5ZL9zjm2/profile.jpg

  /// Returns the public URL for the user's profile image.
  /// No API call — just constructs the URL.
  String getUserProfileUrl(String userId) {
    return _supabase.storage
        .from('users_profile_pictures')
        .getPublicUrl('profiles/$userId/profile.jpg');
  }

  /// Deletes a user's profile image (optional utility).
  Future<void> deleteUserProfileImage(String userId) async {
    try {
      final path = 'profiles/$userId/profile.jpg';
      await _supabase.storage.from('user-images').remove([path]);
      print('🗑️ Profile image deleted');
    } catch (e) {
      print('❌ Delete failed: $e');
    }
  }


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Pick image → Upload to Supabase → Get public URL → Update Firestore
  Future<void> pickAndUploadImage() async {
  try {
  // Pick an image
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile == null) return;

  final user = _auth.currentUser;
  if (user == null) throw Exception('User not signed in');

  final file = File(pickedFile.path);
  final filePath = 'profiles/${user.uid}/profile.jpg';

  // Upload file to Supabase (public bucket)
  await _supabase.storage
      .from('users_profile_pictures')
      .upload(filePath, file, fileOptions: const FileOptions(upsert: true));

  // Generate public URL
  final publicUrl = _supabase.storage
      .from('users_profile_pictures')
      .getPublicUrl(filePath);

  // Immediately update Firebase user collection
  await _firestore.collection('Users').doc(user.uid).update({
  'profileImage': publicUrl,
  'updatedAt': FieldValue.serverTimestamp(),
  });

  debugPrint('✅ Image uploaded and user updated successfully.');
  } on StorageException catch (e) {
  debugPrint('❌ Supabase upload error: ${e.message}');
  } on FirebaseException catch (e) {
  debugPrint('❌ Firebase error: ${e.message}');
  } catch (e) {
  debugPrint('❌ Unexpected error: $e');
  }
  }
  }



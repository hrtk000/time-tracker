import 'package:flutter/material.dart';
import 'dart:io';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis_auth/auth_io.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleDriveService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  drive.DriveApi? _driveApi;

  Future<void> signIn() async {
    try {
      // Perform Google Sign-In
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
String? accessToken = googleAuth.accessToken;
      // Create an authenticated HTTP client
      final client = await clientViaUserConsent(
        ClientId('YOUR_CLIENT_ID', 'YOUR_CLIENT_SECRET'),
        [drive.DriveApi.driveFileScope],
        (url) {
          print('Please go to the following URL and grant access:');
          print('  => $url');
        },
      );

      // Initialize Drive API
      _driveApi = drive.DriveApi(client);
    } catch (error) {
      print('Error signing in: $error');
    }
  }

  Future<void> uploadFile(File file) async {
    if (_driveApi == null) {
      print('Please sign in first.');
      return;
    }

    try {
      // Create a Drive file metadata
      var driveFile = drive.File();
      driveFile.name = file.path.split('/').last;

      // Upload the file
      var media = drive.Media(file.openRead(), file.lengthSync());
      await _driveApi!.files.create(driveFile, uploadMedia: media);
      print('File uploaded successfully!');
    } catch (error) {
      print('Error uploading file: $error');
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    print('User signed out');
  }
}
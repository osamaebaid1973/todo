import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase/firebase_helper.dart';
import 'package:todo/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? userModel;
  User? currentUser;

  AuthProvider() {
    currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null) {
      initUser();
    }
  }
  initUser()async{
    userModel = await FirebaseHelper.getUser(currentUser!.uid);
    notifyListeners();
  }
}
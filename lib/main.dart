import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_being/screens/first.dart';
import 'package:flutter_being/screens/log_in.dart';
import 'package:flutter_being/screens/sign_in.dart';
import 'package:flutter_being/screens/splash.dart';
import 'package:flutter_being/screens/todo.dart';
import 'constants/shared.dart';
import 'package:flutter_being/screens/todo.dart';
import 'package:flutter_being/screens/home.dart';
void main(){
  //devlopers - abhishek saxena, utkarsh singh
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BEING',
      routes: {
        'splash':(context) => Splash(),
        'login':(context) => Login(),
        'signin':(context) => SignIn(),
        'first':(context) => First(),
        'home':(context) => Home(),
        'todo':(context) => ToDo()
      },

      initialRoute: 'splash',
      // home: ToDo(),
    )
  );

  print(name);
  print(email);
  print(pass);
}
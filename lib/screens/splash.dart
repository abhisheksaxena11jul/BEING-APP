import 'package:flutter/material.dart';
import 'package:flutter_being/constants/colors.dart';
import 'package:flutter_being/screens/first.dart';
import 'package:flutter_being/screens/log_in.dart';
import 'package:flutter_being/screens/sign_in.dart';



class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async{
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => First()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: tdBg,
      height: 50,
      width: 50,
      child: Image.asset('assets/logo.jpeg'),
    );
  }
}



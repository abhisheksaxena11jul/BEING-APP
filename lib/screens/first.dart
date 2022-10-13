import 'package:flutter/material.dart';
import 'package:flutter_being/constants/colors.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: 290,
          width: 320,
          decoration: BoxDecoration(
              color: tdText_light,
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Let's Get Started...\nwith your journey with\n'Being'",

                    style: TextStyle(
                      fontSize: 25,
                      color: tdText_dark,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comic'
                    ),
                    
                  ),
                ),

                SizedBox(
                  width: 180.0,
                  height: 40.0,
                  child: ElevatedButton(
                    child: Text("Sign In"),
                    onPressed: () {
                      Navigator.pushNamed(context, 'signin');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: tdText_dark,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 8,bottom: 8),
                  child: Text(
                    "Or",

                    style: TextStyle(
                      fontSize: 20,
                      color: tdText_dark,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comic'
                    ),
                    
                  ),
                ),

                SizedBox(
                  width: 180.0,
                  height: 40.0,
                  child: ElevatedButton(
                    child: Text("LogIn"),
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: tdText_dark,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                )
              ],
            )
          ),
        )
      );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_being/constants/colors.dart';
import 'package:flutter_being/constants/shared.dart';
import 'package:image_picker/image_picker.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  @override
  Widget build(BuildContext context) {
    String text = '';
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: tdText_light,
        ),
        
        body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
          child: ListView(

              children: [          
                //HELLO BEING CONTAINER
                Container(
                  padding: EdgeInsets.only(top:30,bottom: 10,left: 10),
                  child: Text(
                    //mein text
                    "HELLO\nBEING!",

                    //styling text
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: tdText_light,
                      fontFamily: 'Comic'
                    ),
                  )
                ),

                //CAPTION CONTAINER
                Container(
                  padding: EdgeInsets.only(top:10,bottom: 20,left: 10),
                  child: Text(
                    //mein text
                    "Sign up to\nget started",

                    //styling text
                    style: TextStyle(
                      fontSize: 27,
                      color: tdText_light,
                    ),
                  )
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      padding: EdgeInsets.only(top:10,bottom: 10,left: 15),
                      child: Text(
                        //mein text
                        "Name :",
                        //styling text
                        style: TextStyle(
                          fontSize: 25,
                          color: tdText_light,
                          fontFamily: 'Comic'
                        ),
                      )
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                      child: TextField(
                        
                        onChanged: (value) {
                          name = value;
                        },

                        decoration: TextInputDecoration.copyWith(
                          hintText: 'Enter Your Name',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: tdText_light,
                              width: 3,
                            ),
                          )
                        )
                      ),
                    )
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top:10,bottom: 10,left: 15),
                      child: Text(
                        //mein text
                        "Email :",
                        //styling text
                        style: TextStyle(
                          fontSize: 25,
                          color: tdText_light,
                          fontFamily: 'Comic'
                        ),
                      )
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                      child: TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: TextInputDecoration.copyWith(
                          hintText: 'enteryourgmail@gmail.com',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)
                          ),
                           
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: tdText_light,
                              width: 3,
                            ),
                          )
                        )
                      ),
                    )
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top:10,bottom: 10,left: 15),
                      child: Text(
                        //mein text
                        "Password :",
                        //styling text
                        style: TextStyle(
                          fontSize: 25,
                          color: tdText_light,
                          fontFamily: 'Comic'
                        ),
                      )
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                      child: TextField(
                        onChanged: (value) {
                          pass = value;
                        },
                        obscureText: true,
                        decoration: TextInputDecoration.copyWith(
                          hintText: 'Enter Password',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)
                          ),
                           
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: tdText_light,
                              width: 3,
                            ),
                          )
                        )
                      ),
                    ),

                    SizedBox(height: 20,),

                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child:
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 150.0,
                          height: 50.0,
                          child: ElevatedButton(
                            //functionality
                            onPressed: () async{
                              print(email);
                              print(pass);
                              try {
                                UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: email,
                                  password: pass
                                );
                                Navigator.pushNamed(context, 'home');
                                print("DONE");

                              } 
                              
                              on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  text = 'The password provided is too weak.';
                                  print(text);
                                } else if (e.code == 'email-already-in-use') {
                                  text = 'The account already exists for that email.';
                                  print(text);
                                }
                              } 
                              
                              catch (e) {
                                print(e);
                              }
                            }, 

                            //styling

                            child: Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold),),

                            style: ElevatedButton.styleFrom(
                              primary: tdText_light,
                              onPrimary: tdText_dark,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 40,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                        Container(
                          child:
                            Text("Already a User?", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        ),

                        Container(
                          child:
                            SizedBox(
                              child: ElevatedButton(
                                //functionality
                                onPressed: () async{
                                  Navigator.pushNamed(context, 'login');
                                }, 
                                //styling

                                child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline,),),

                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  onPrimary: tdText_light,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        
                      ],
                    )

                  ],
                ),

              ],
            ),
        ),
        )
        
      );
  }

  
}
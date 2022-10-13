import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_being/constants/colors.dart';
import 'package:flutter_being/constants/shared.dart';

class Login extends StatelessWidget {
  
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 200,
      width: double.infinity,
      decoration:  BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover),
      ),

      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: tdText_light,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.png'),
              fit: BoxFit.cover
            )
          ),
          child: ListView(
            children: [          
              //HELLO BEING CONTAINER
              Container(
                padding: EdgeInsets.only(top:20,bottom: 10,left: 10),
                child: Text(
                  //mein text
                  "WELCOME BACK\nBEING!",

                  //styling text
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
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
                  "Login to\ncontinue",

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
                    padding: EdgeInsets.only(top: 5, bottom: 5, left: 12, right: 12),
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

              SizedBox(
                height: 20,   
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
                                UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: email,
                                  password: pass
                                );Navigator.pushNamed(context, 'home');
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  print('No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                  print('Wrong password provided for that user.');
                                }
                              }

                            },
                            //styling

                            child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold),),

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
                            Text("Not a User?", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        ),

                        Container(
                          child:
                            SizedBox(
                              child: ElevatedButton(
                                //functionality
                                onPressed: () async{
                                  Navigator.pushNamed(context, 'sigin');
                                }, 
                                //styling

                                child: Text("SignIn", style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline,),),

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
                    ),
                ],
              ),

            ],
          ),
        )
        
      ),
    );
  }
}
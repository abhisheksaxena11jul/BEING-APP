import 'package:flutter/material.dart';
import 'package:flutter_being/constants/colors.dart';
import 'package:flutter_being/constants/shared.dart';
import 'package:flutter_being/screens/first.dart';
import 'package:flutter_being/screens/todo.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,

      appBar: buildAppBar(),

      drawer: NavigationDrawer(),

      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),

          Container(
            padding: EdgeInsets.only(top:20,bottom: 10,left: 10),
            child: Text(
              //mein text
              "Welcome\n$name",

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
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top:0,bottom: 10,left: 10),
                child: Text(
                  //mein text
                  "to",
                  //styling text
                  style: TextStyle(
                    fontSize: 27,
                    color: tdText_light,
                  ),
                )
              ),

              Container(
                padding: EdgeInsets.only(top:0,bottom: 10,left: 10),
                child: Text(
                  //mein text
                  "'BEING':",

                  //styling text
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: tdText_light,
                    fontFamily: 'Comic'
                  ),
                )
              ),
            ],
          ),

          SizedBox(height: 20,),

          SizedBox(
            height: 170,
            width: 50,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              onTap: () {
                Navigator.pushNamed(context, 'todo');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),

              tileColor: tdText_light,
              leading: Icon(
                Icons.workspaces_filled,
                color: tdText,
                size: 40,
              ),
              
              subtitle: Text(
                "this part of our app helps you get through tasks in your daily life ", 
                style: TextStyle(
                  fontSize: 20,
                  color: tdText_dark,
                ),
              ),

              title: Text(
                "Daily Life",
                style: TextStyle(
                  fontSize: 50,
                  color: tdText,
                ),
              ),
            ),
          ),

          Divider(),

          SizedBox(
            height: 170,
            width: 50,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              onTap: () {
                
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),

              tileColor: tdText_light,
              leading: Icon(
                Icons.accessibility,
                color: tdText,
                size: 40,
              ),
              
              subtitle: Text(
                "this is the part of the app which tackles with problems such as depression and suggestion you need to improve your life...", 
                style: TextStyle(
                  fontSize: 17,
                  color: tdText_dark,
                ),
              ),

              title: Text(
                "Cognition",
                style: TextStyle(
                  fontSize: 50,
                  color: tdText,
                ),
              ),
            ),
          ),

      ],
      ),

    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

    Widget buildHeader(BuildContext context){
      return Container(
        color: tdBg,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top
        ),
      );
    }

    Widget buildMenuItems(BuildContext context){
      return Container(
        color: tdBg,
        height: 1000,
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 14,
          children: [
            ListTile(
              leading: const Icon(
                Icons.home_outlined
              ),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
              },
              title:  Text('Home'),
            ),

            Divider(),

            ListTile(
              leading: const Icon(
                Icons.workspaces_filled
              ),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  ToDo()));
              },
              title:  Text('Daily Life'),
              
            ),

            ListTile(
              leading: const Icon(
                Icons.accessibility
              ),
              onTap: () {},
              title:  Text('Cognition'),
            ),

            Divider(),

            ListTile(
              leading: const Icon(
                Icons.exit_to_app
              ),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const First()));
              },
              title:  Text('Log Out'),
            ),
          ],
        ),
      );
    }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context)
          ],
        ),
      ),
    );
  }
}
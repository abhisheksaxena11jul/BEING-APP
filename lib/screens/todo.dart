import 'package:flutter/material.dart';
import 'package:flutter_being/constants/colors.dart';
import 'package:flutter_being/constants/shared.dart';
import 'package:flutter_being/screens/first.dart';
import 'package:flutter_being/screens/home.dart';
import 'package:flutter_being/constants/todo_data.dart';
import 'package:flutter_being/widgets/todo_item.dart';

import '../model/todo1.dart';

class ToDo extends StatefulWidget {
  ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  final todoList = ToDo1.todoList();
  List<ToDo1> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildAppBar(),

      drawer: NavigationDrawer(),

      body: Stack(
        children: [
          Container(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, top: 25),
                  child: Text(
                    "Daily Life",
                    style: TextStyle(
                      color: tdText_light,
                      fontSize: 45,
                      fontFamily: 'Comic'
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Text(
                    "this part of our app helps you get through tasks in your daily life ",
                    style: TextStyle(
                      color: tdText_light,
                      fontSize: 20,
                      fontFamily: 'Comic'
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                // searchBox(),

                searchBox(),

                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 20, left: 20),
                  child: Text("All ToDo's", style: TextStyle(fontSize: 35,color: tdText_light))
                ),

                for(ToDo1 todoo in _foundToDo)            
                  ToDoItem(
                    todo : todoo,
                    onToDoChanged: handleToDoChange,
                    onDeleteItem: deleteToDoItem,
                  ),
                
              ],
            ),

          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),

                    decoration: BoxDecoration(
                      color: tdBg,
                      boxShadow: const[ BoxShadow(
                        color: Colors.grey, 
                        offset: Offset(0,0),
                        blurRadius: 10,
                        spreadRadius: 0
                      )],

                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: 'Add ToDo Item',
                        border: InputBorder.none
                      ),
                    ),

                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    child: Text("+", style: TextStyle(fontSize: 40),),
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: tdText_dark,
                      minimumSize: Size(60,60),
                      elevation: 10
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),

    );
  }

  Container searchBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      decoration: BoxDecoration(
        color: tdBg,
        borderRadius: BorderRadius.circular(20)
      ),

      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, color: tdText_dark,size: 20,),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 20),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color:tdText_dark)
        ),
      ),
    );
  }

  void handleToDoChange(ToDo1 todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void deleteToDoItem(String id){
    setState((){
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo){
    setState(() {
      todoList.add(ToDo1(
        id: DateTime.now().millisecondsSinceEpoch.toString(), 
        todoText: toDo
      ));
    });

    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo1> results = [];

    if(enteredKeyword.isEmpty){
      results = todoList;
    }

    else{
      results = todoList
      .where((item) => item.todoText!
        .toLowerCase()
        .contains(enteredKeyword.toLowerCase()))
      .toList();
    }

    setState(() {
      _foundToDo = results;
    });
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
        height: 1000,
        color: tdBg,
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
              onTap: () {},
              title:  Text('Daily Life'),
            ),

            ListTile(
              leading: const Icon(
                Icons.home_outlined
              ),
              onTap: () {},
              title:  Text('Cognition'),
            ),

            Divider(),

            ListTile(
              leading: const Icon(
                Icons.home_outlined
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
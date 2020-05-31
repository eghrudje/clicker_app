import 'package:clickerapp/screens/quizHistory_screen.dart';
import 'package:clickerapp/screens/quiz_screen.dart' as quiz;
import 'package:clickerapp/screens/settings_screen.dart';
import 'package:clickerapp/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class DashboardScreen extends StatefulWidget {
  Socket socket;

  signUpScreen(Socket s) {
    this.socket = s;
  }

  final Socket channel;

  DashboardScreen({Key key, @required this.channel}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, bottom: 50, left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 150, right: 5, left: 5, bottom: 10),
                  child: Container(
                    height: 200,
                    width: 380,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 20),
                            child: CircleAvatar(
                              radius: 50,
                            ),
                          ),
                          SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.only(top: 60.0, left: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Name',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Department',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontStyle: FontStyle.italic,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                Text(
                                  'Level',
                                  style: TextStyle(
                                    fontSize: 20,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 380, bottom: 15),
                  child: Container(
                    height: 400,
                    width: 380,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => quiz.QuizScreen(
                                        channel: widget.channel,
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    height: 150,
                                    width: 165,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.white70, width: 1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      elevation: 10,
                                      child: Column(
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(
                                              Icons.edit,
                                              color: Colors.green,
                                              size: 40,
                                            ),
                                            onPressed: () {},
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 40, bottom: 10),
                                            child: Text(
                                              'Take Quiz',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 23,
                                                color: Colors.grey[600],
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  height: 150,
                                  width: 165,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.white70, width: 1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    elevation: 10,
                                    child: Column(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            Icons.info,
                                            color: Colors.purple,
                                            size: 40,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 40, bottom: 10),
                                          child: Text(
                                            'About',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 23,
                                              color: Colors.grey[600],
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => QuizHistoryScreen(),
                                    ),
                                  ),
                                  child: Container(
                                    height: 150,
                                    width: 165,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.white70, width: 1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      elevation: 10,
                                      child: Column(
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(
                                              Icons.history,
                                              color: Colors.teal,
                                              size: 40,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 40, bottom: 10),
                                            child: Text(
                                              'Quiz History',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 23,
                                                color: Colors.grey[600],
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  height: 150,
                                  width: 165,
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SettingsScreen(),
                                      ),
                                    ),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.white70, width: 1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      elevation: 10,
                                      child: Column(
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(
                                              Icons.settings,
                                              color: Colors.deepOrangeAccent,
                                              size: 40,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 40, bottom: 10),
                                            child: Text(
                                              'Settings',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 23,
                                                color: Colors.grey[600],
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createNewConnection() async {
    //create a connection
    Socket socket = await Socket.connect('192.168.43.254', 3001);
    // call
    quiz.QuizScreen(
      channel: socket,
    );
  }
}

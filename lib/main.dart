import 'dart:io';

import 'package:clickerapp/screens/dashboard_screen.dart';
import 'package:clickerapp/screens/sign_up.dart';
import 'package:clickerapp/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  Socket sock = await Socket.connect('192.168.0.103', 3001);
  runApp(MaterialApp(
    home: HomeScreen(
      channel: sock,
    ),
  ));
}

class HomeScreen extends StatefulWidget {
  final Socket channel;

  HomeScreen({Key key, @required this.channel}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Image(
                    image: AssetImage('assets/logos/logo3.jpg'),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 180, bottom: 20),
                  child: Container(
                    height: 500,
                    width: 380,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.purple, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, bottom: 10, top: 15),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'USERNAME',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, bottom: 10, top: 10),
                                      child: TextField(
                                        autocorrect: false,
                                        decoration:
                                            InputDecoration(hintText: ''),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, bottom: 10, top: 15),
                                child: Text(
                                  'PASSWORD',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, bottom: 10, top: 10),
                                      child: TextField(
                                        obscureText: true,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                            //labelText: 'Password',
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DashboardScreen(),
                                  ),
                                ),
                                child: Container(
                                  height: 60,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.blue[700],
                                  ),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => DashboardScreen(),
                                        ),
                                      ),
                                      child: Text(
                                        'SIGN IN',
                                        style: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 5.0,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'New user?',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => signUpScreen(widget.channel),
                                    ),
                                  ),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

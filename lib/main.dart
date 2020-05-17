import 'dart:io';

import 'package:clickerapp/screens/dashboard_screen.dart';
import 'package:clickerapp/screens/sign_up.dart';
import 'package:clickerapp/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  Socket sock = await Socket.connect('192.168.0.103', 3001);
  runApp(MaterialApp(
    home: HomeScreen(
      channel: sock,
    ),
  ));
}

class HomeScreen extends StatefulWidget {
  Socket socket;

  signUpScreen(Socket s) {
    this.socket = s;
  }

  final Socket channel;

  HomeScreen({Key key, @required this.channel}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                )
              : Stack(
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
                                side:
                                    BorderSide(color: Colors.purple, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 5,
                              child: new Form(
                                key: _formKey,
                                autovalidate: _autoValidate,
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
                                                  left: 30,
                                                  bottom: 10,
                                                  top: 10),
                                              child: TextFormField(
                                                autocorrect: false,
                                                controller:
                                                    _firstNameController,
                                                decoration: InputDecoration(
                                                    hintText: ''),
                                                validator: (val) {
                                                  if (val.length == 0) {
                                                    return 'Password Not filled';
                                                  } else {
                                                    return null;
                                                  }
                                                },
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
                                                  left: 30,
                                                  bottom: 10,
                                                  top: 10),
                                              child: TextFormField(
                                                controller: _lastNameController,
                                                obscureText: true,
                                                autocorrect: false,
                                                decoration: InputDecoration(
                                                    //labelText: 'Password',
                                                    ),
                                                validator: (val) {
                                                  if (val.length == 0) {
                                                    return 'Password Not filled';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: MaterialButton(
                                        height: 60,
                                        minWidth: 300,
                                        color: Colors.blue[700],
                                        child: Center(
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
                                        onPressed: submit,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                              builder: (_) =>
                                                  signUpScreen(widget.channel),
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
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  submit() async {
    //Checks for validation
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _isLoading = true;
      });
      print('sending to server');
      //TODO: Server code comes here

      // concat strings
      String message = 'Testing the mic. !-2';

      // send to server //
      widget.channel.write(message + '\n');

      //get response //check if response was a true before proceeding //
      String response = "okay";

      if (response == "okay") {
        setState(() {
          _isLoading = false;
          print('sign up successful');
          //save to sharedpref
        });
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('matricNumber', _firstNameController.text);
        prefs.setString('password', _lastNameController.text);

        // goes to the next activity
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DashboardScreen(),
            ));
      } else {
        setState(() {
          print('sign up NOT successful');
          _isLoading = false;
//toast an error message to user
        });
      }
    } else {
      setState(() => _autoValidate = true);
    }
  }

  @override
  void dispose() {
    widget.channel.close();
    super.dispose();
  }
}

import 'dart:io';

import 'package:clickerapp/screens/dashboard_screen.dart';
import 'package:clickerapp/screens/sign_up.dart';
import 'package:clickerapp/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {


  final Socket channel;

  HomeScreen({Key key, @required this.channel}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _matricNoController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  int counter = 0;
  String fullName;
  String level;
  String department;

 String receivedMessage(String message)  {
//CATCH FIRST TIME EXCEPTION
   print("Reached here");

//   counter++;
    //.................Split ohhhhh... when you are done splitting, then setState.............//
  //  if (counter > 1) {
      print('Incoming: ${message.toString()}');
      //split
      dynamic splited = message.split('*#');

      print(splited);

      fullName = splited[0];
      level = splited[1];
      department = splited[2];
      print(fullName + level + department);


//      SharedPreferences prefs;
//      prefs = await SharedPreferences.getInstance();
//
//      prefs.setString('matricNumber', _matricNoController.text.trim());
//      prefs.setString('name', splited[0]);
//      prefs.setString('level', splited[1]);
//      prefs.setString('department', splited[2]);

      // goes to the next activity
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DashboardScreen(
              channel: widget.channel,
              fullName: fullName,
              level: level,
              department: department,

            ),
          ));
  //  }

    return "done";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
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
                                side: BorderSide(color: Colors.red, width: 1),
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
                                                controller: _matricNoController,
                                                decoration: InputDecoration(
                                                    hintText: ''),
                                                validator: (val) {
                                                  if (val.length == 0) {
                                                    return 'Username Not filled';
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
                                                controller: _passwordController,
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
                    StreamBuilder(
                        stream: widget.channel,
                        builder: (context, snapshot) {
                          return Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                ),
                                Opacity(
                                  opacity: 0.0,
                                  child: Text(
                                    snapshot.hasData
                                        ? receivedMessage(
                                        String.fromCharCodes(snapshot.data))
                                        : '',
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
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
      // concat strings
      String message =
          _matricNoController.text.trim() + "|" + _passwordController.text;
      try {
        widget.channel.write(message +'|login'+ '\n');
        print('Sent to server');

       // setState(() {
      //    _isLoading = true;
       // });

      } catch (e) {
        Fluttertoast.showToast(
            msg: 'Network Error..Reconnect',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
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

/**
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('matricNumber',_matricNoController.text.trim());
    prefs.setString('password',_passwordController.text);


    // goes to the next activity
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (_) => DashboardScreen(channel: widget.channel,),
    ));
 */

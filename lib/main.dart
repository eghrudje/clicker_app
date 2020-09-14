import 'dart:io';

import 'package:clickerapp/screens/dashboard_screen.dart';
import 'package:clickerapp/screens/sign_up.dart';
import 'package:clickerapp/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class SignIn extends StatefulWidget {
  Socket channel;

  SignIn({Key key, @required this.channel}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isLoading = false;
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _matricNoController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  int counter = 0;
  bool visible = false;
  String fullName;
  String level;
  String department;
  String matricNo;

//  Iterable<int> it = [];

  String receivedMessage(String message) {
//CATCH FIRST TIME EXCEPTION
    counter++;
    if (counter > 0) {
      print('Incoming: ${message.toString()}');

      try {
        print("Reached here fa. Message: " + message.toString());
        if (message.toString().length > 3) {
          print('Incame: ${message.toString()}');
          //split
          List<String> splited = message.split('*#');
          print(splited);

          fullName = splited[0].toString();
          level = splited[1].toString();
          department = splited[2].toString();
          matricNo = _matricNoController.text;
          print(fullName + level + department + matricNo);
          _isLoading = true;
        }
      } catch (e) {
        throw Exception("Something went wrong");
      }
    }

    // counter++;
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
                    height: MediaQuery.of(context).size.height - 10,
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
                                            left: 30, bottom: 10, top: 10),
                                        child: TextFormField(
                                          autocorrect: false,
                                          controller: _matricNoController,
                                          decoration:
                                              InputDecoration(hintText: ''),
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
                                            left: 30, bottom: 10, top: 10),
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
                                padding: const EdgeInsets.all(10),
                                child: MaterialButton(
                                  height: 60,
                                  minWidth: 300,
                                  color: Colors.blue[700],
                                  child: Center(
                                    child: Text(
                                      'VERIFY',
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
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: visible
                                    ? MaterialButton(
                                        height: 60,
                                        minWidth: 300,
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'CONTINUE',
                                            style: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: 5.0,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onPressed: goto,
                                      )
                                    : Container(),
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
//                  initialData: it,
                  stream: widget.channel,
                  builder: (context, snapshot) {
                    return Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ip = prefs.getString('ipAddress');
    String port = prefs.getString('port');
    Socket socket = await Socket.connect(ip, int.parse(port));
    try {
      widget.channel.close();
      widget.channel = socket;
    } catch (e) {}
    //Checks for validation
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      // concat strings
      String message =
          _matricNoController.text.trim() + "|" + _passwordController.text;
      try {
        socket.write('login|' + message);
        print('Sent to server');
        //MAKE CONTINUE VISIBLE
        setState(() {
          visible = true;
        });
      } catch (e) {
        Toast.show('Network Error..Reconnect', context,
            duration: Toast.LENGTH_SHORT);
      }
    } else {
      setState(() => _autoValidate = true);
    }
  }

  void initState() {
    super.initState();
  }

  @override
  void dispose() {
//    widget.channel.destroy();
    super.dispose();
  }

  void goto() {
    if (_isLoading) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => DashboardScreen(
              channel: widget.channel,
              fullName: fullName,
              level: level,
              department: department,
              matric: matricNo,
            ),
          ));
    }
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

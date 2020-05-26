import 'dart:io';
import 'package:clickerapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clickerapp/screens/dashboard_screen.dart';
import 'package:clickerapp/screens/sign_up.dart';
import 'package:clickerapp/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp(MaterialApp(
    home: ConfigScreen(),
  ));
}

class ConfigScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ConfigScreen> {
  bool _isLoading = false;
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _ipAddressController = new TextEditingController();
  TextEditingController _portController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                                side: BorderSide(color: Colors.red, width: 0.2),
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
                                          'SETUP',
                                          style: TextStyle(
                                            color: Colors.black,
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
                                          'IP Address',
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
                                                keyboardType: TextInputType.phone,
                                                controller:
                                                    _ipAddressController,
                                                decoration: InputDecoration(
                                                    hintText: ''),
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return "Enter IP Address";
                                                  }
//                                                  String ip =
//                                                      '/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\z/';
//                                                  RegExp regExp =
//                                                      new RegExp(ip);
//                                                  if (regExp.hasMatch(value)) {
                                                  if (value.length > 6) {
                                                    return null;
                                                  }else{
                                                    return 'Enter a valid IP Address';
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
                                          'PORT',
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
                                                controller: _portController,
                                                autocorrect: false,
                                                keyboardType: TextInputType.phone,
                                                decoration: InputDecoration(
                                                    //labelText: 'Password',
                                                    ),
                                                validator: (val) {
                                                  assert(int.parse(val) is int);
                                                  if (val.length == 0) {
                                                    return 'Port Not filled';
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
                                            'Config',
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
try{
  Socket sock = await Socket.connect(
      _ipAddressController.text, int.parse(_portController.text));

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
    sock.write(message);

    //get response //check if response was a true before proceeding //
    String response = "okay";

    if (response == "okay") {
      setState(() {
        _isLoading = false;
        print('sign up successful');
        //save to sharedpref
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('ipAddress', _ipAddressController.text);
      prefs.setString('port', _portController.text);
      print("Sent to sharedpref");

      // goes to the next activity
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomeScreen(channel: sock),
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
}catch  (e){
  //toast an error message to user
  Fluttertoast.showToast(
      msg: e.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

  }

  @override
  void dispose() {
    super.dispose();
  }
}

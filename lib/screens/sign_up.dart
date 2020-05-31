import 'package:clickerapp/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

//void main() async {
//  Socket sock = await Socket.connect('192.168.0.103', 3001);
////
////  if (counter<1){
////    sock.write("Connected");
////    sock.flush();
////  }
//
//  runApp(signUpScreen(sock));
//}

class signUpScreen extends StatefulWidget {
  Socket socket;

  signUpScreen(Socket s) {
    this.socket = s;
  }

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<signUpScreen> {
  List<DropdownMenuItem<int>> listDrop = [];
  int selected = null;
  void loadData(){
    listDrop = [];
    listDrop.add(new DropdownMenuItem(child: new Text('Level:  100'), value: 1,));
    listDrop.add(new DropdownMenuItem(child: new Text('Level:  200'), value: 2,));
    listDrop.add(new DropdownMenuItem(child: new Text('Level:  300'), value: 3,));
    listDrop.add(new DropdownMenuItem(child: new Text('Level:  400'), value: 4,));
    listDrop.add(new DropdownMenuItem(child: new Text('Level:  500'), value: 5,));
    listDrop.add(new DropdownMenuItem(child: new Text('Level:  600'), value: 6,));
  }
  bool _isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController =
      new TextEditingController();
  TextEditingController _matricNoController = new TextEditingController();
  TextEditingController _levelController = new TextEditingController();
  TextEditingController _departmentController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    loadData();
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
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Image(
                              image: AssetImage('assets/logos/logo3.jpg'),
                              fit: BoxFit.scaleDown,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 160, bottom: 50, right: 15, left: 15),
                      child: Container(
                        height: 800,
                        width: 380,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 5,
                          child: new Form(
                            key: _formKey,
                            autovalidate: _autoValidate,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    'CREATE ACCOUNT',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: Colors.purpleAccent,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: TextFormField(
                                            autocorrect: false,
                                            controller: _firstNameController,
                                            decoration: InputDecoration(
                                              labelText: 'First Name:',
                                              fillColor: Colors.red,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: BorderSide(),
                                              ),
                                            ),
                                            validator: (val) {
                                              if (val.length == 0) {
                                                return 'First Name Not filled';
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
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: TextFormField(
                                            controller: _lastNameController,
                                            autocorrect: false,
                                            decoration: InputDecoration(
                                              labelText: 'Last Name:',
                                              fillColor: Colors.red,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: BorderSide(),
                                              ),
                                            ),
                                            validator: (val) {
                                              if (val.length == 0) {
                                                return 'Last Name Not filled';
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
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: TextFormField(
                                            controller: _matricNoController,
                                            autocorrect: false,
                                            decoration: InputDecoration(
                                              labelText: 'Matric No:',
                                              fillColor: Colors.red,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: BorderSide(),
                                              ),
                                            ),
                                            validator: (val) {
                                              if (val.length == 0) {
                                                return 'Matric No Not filled';
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
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: TextFormField(
                                            controller: _departmentController,
                                            autocorrect: false,
                                            decoration: InputDecoration(
                                              labelText: 'Department:',
                                              fillColor: Colors.red,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: BorderSide(),
                                              ),
                                            ),
                                            validator: (val) {
                                              if (val.length == 0) {
                                                return 'Department Not filled';
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
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: DropdownButton(
                                            elevation: 16,
                                            icon: Padding(
                                              padding: EdgeInsets.only(left: 200, right: 10, top: 10, bottom: 10),
                                                child: Icon(Icons.arrow_drop_down)),
                                            value: selected,
                                            items: listDrop,
                                            hint: Padding(
                                              padding: const EdgeInsets.only(left: 40, right: 20),
                                              child: Text('Level',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                selected = value;
                                              });
                                            }
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: TextFormField(
                                            controller: _passwordController,
                                            autocorrect: false,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              labelText: 'Password:',
                                              fillColor: Colors.red,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(25),
                                                borderSide: BorderSide(),
                                              ),
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
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: TextFormField(
                                            controller:
                                                _confirmPasswordController,
                                            obscureText: true,
                                            autocorrect: false,
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.security),
                                              labelText: 'Confirm Password:',
                                              fillColor: Colors.red,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: BorderSide(),
                                              ),
                                            ),
                                            validator: (val) {
                                              if (val.length == 0) {
                                                return 'Confirmed Password Not filled';
                                              } else {
                                                if (_confirmPasswordController
                                                        .text ==
                                                    _passwordController.text) {
                                                  return null;
                                                } else {
                                                  return 'Mismatch';
                                                }
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
                                    minWidth: 200,
                                    height: 40,
                                    color: Color(0xFF801E48),
                                    child: Text(
                                      'Create',
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        letterSpacing: 5.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: submit,
                                  ),
                                ),
                                Text(
                                  'If you already have an account..',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => HomeScreen(
                                          channel: widget.socket,
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      height: 40,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Colors.blue[700],
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: Colors.blueAccent,
                                            blurRadius: 5,
                                            offset: Offset(0, 0.5),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => HomeScreen(),
                                            ),
                                          ),
                                          child: Text(
                                            'Login',
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

  // ignore: missing_return
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
      String message = 'signUP page';

      // send to server //
      widget.socket.write(message + '\n');

      //get response //check if response was a true before proceeding //
      String response = "okay";

      if (response == "okay") {
        setState(() {
          _isLoading = false;
          print('sign up successful');
        });

        // goes to the next activity
        Navigator.pop(context);
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
    widget.socket.close();
    super.dispose();
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

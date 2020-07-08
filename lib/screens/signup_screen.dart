import 'package:clickerapp/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? buildVerticalLayout()
              : buildHorizontalLayout();
        },
      ),
    );
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

class buildVerticalLayout extends StatefulWidget {
  @override
  _buildVerticalLaoutState createState() => _buildVerticalLaoutState();
}

class _buildVerticalLaoutState extends State<buildVerticalLayout> {
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
    return SafeArea(
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
                                        child: TextFormField(
                                          controller: _levelController,
                                          autocorrect: false,
                                          decoration: InputDecoration(
                                            labelText: 'Level:',
                                            fillColor: Colors.red,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              borderSide: BorderSide(),
                                            ),
                                          ),
                                          validator: (val) {
                                            if (val.length == 0) {
                                              return 'Level Not filled';
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
                                      builder: (_) => SignIn(),
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
                                            builder: (_) => SignIn(),
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
    );
  }

  submit() {
    //Checks for validation
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _isLoading = true;
      });
      //TODO: Server code comes here
      print('running');
      setState(() {
        _isLoading = false;

        print('done');
      });
    } else {
      setState(() => _autoValidate = true);
    }
  }
}

class buildHorizontalLayout extends StatefulWidget {
  @override
  _buildHorizontalLayoutState createState() => _buildHorizontalLayoutState();
}

class _buildHorizontalLayoutState extends State<buildHorizontalLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 400,
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
              padding: const EdgeInsets.only(top: 160, right: 50, left: 50),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
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
                                    decoration: InputDecoration(
                                      labelText: 'First Name:',
                                      fillColor: Colors.red,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
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
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      labelText: 'Last Name:',
                                      fillColor: Colors.red,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
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
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      labelText: 'Matric No:',
                                      fillColor: Colors.red,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
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
                                    autocorrect: false,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: 'Password:',
                                      fillColor: Colors.red,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
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
                                    obscureText: true,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.security),
                                      labelText: 'Confirm Password:',
                                      fillColor: Colors.red,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide(),
                                      ),
                                    ),
                                    validator: (val) {
                                      if (val.length == 0) {
                                        return 'Confirmed Password Not filled';
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
                          child: Container(
                            height: 40,
                            width: 300,
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.orangeAccent,
                                  blurRadius: 5,
                                  offset: Offset(0, 0.5),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.orange[700],
                            ),
                            child: Center(
                              child: Text(
                                'Create',
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
                                builder: (_) => SignIn(),
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
                                      builder: (_) => SignIn(),
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
    );
  }
}

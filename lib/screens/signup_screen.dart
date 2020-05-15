import 'package:clickerapp/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import '../main.dart';

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
        builder: (context, orientation){
          return orientation == Orientation.portrait? buildVerticalLayout() :  buildHorizontalLayout();
        },
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height-80);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height-80);
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
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
              padding: const EdgeInsets.only(top: 160, bottom: 50, right: 15, left: 15),
              child: Container(
                height: 800,
                width: 380,
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
                                  validator: (val){
                                    if(val.length==0){
                                      return 'First Name Not filled';
                                    }else{
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
                                  validator: (val){
                                    if(val.length==0){
                                      return 'Last Name Not filled';
                                    }else{
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
                                  validator: (val){
                                    if(val.length==0){
                                      return 'Matric No Not filled';
                                    }else{
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
                                    labelText: 'Department:',
                                    fillColor: Colors.red,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  validator: (val){
                                    if(val.length==0){
                                      return 'Department Not filled';
                                    }else{
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
                                    labelText: 'Level:',
                                    fillColor: Colors.red,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  validator: (val){
                                    if(val.length==0){
                                      return 'Level Not filled';
                                    }else{
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
                                  validator: (val){
                                    if(val.length==0){
                                      return 'Password Not filled';
                                    }else{
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
                                  validator: (val){
                                    if(val.length==0){
                                      return 'Confirmed Password Not filled';
                                    }else{
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
                            child: Text('Create',
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
                      Text('If you already have an account..',
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
                            MaterialPageRoute(builder: (_) => HomeScreen(),),),
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
                                  MaterialPageRoute(builder: (_) => HomeScreen(),),),
                                child: Text('Login',
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

          ],
        ),
      ),
    );
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
              padding: const EdgeInsets.only(top: 160, right: 50, left: 50),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 600,
                  width: 600,
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
                                    validator: (val){
                                      if(val.length==0){
                                        return 'First Name Not filled';
                                      }else{
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
                                    validator: (val){
                                      if(val.length==0){
                                        return 'Last Name Not filled';
                                      }else{
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
                                    validator: (val){
                                      if(val.length==0){
                                        return 'Matric No Not filled';
                                      }else{
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
                                    validator: (val){
                                      if(val.length==0){
                                        return 'Password Not filled';
                                      }else{
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
                                    validator: (val){
                                      if(val.length==0){
                                        return 'Confirmed Password Not filled';
                                      }else{
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
                              child: Text('Create',
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
                        Text('If you already have an account..',
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
                              MaterialPageRoute(builder: (_) => HomeScreen(),),),
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
                                    MaterialPageRoute(builder: (_) => HomeScreen(),),),
                                  child: Text('Login',
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

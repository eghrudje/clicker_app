import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QuizScreen extends StatefulWidget {
//  setup() async {
//    //get ip from shared pref and save to a string
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    String stringIp = prefs.getString('ipAddress');
//    //get port from sharedpref and save to int
//    String stringPort = prefs.getString('port');
//    int port = int.parse(stringPort);
//    // pass those params to Socket.connect(ip,port);
//
//    Socket sock = await Socket.connect(stringIp, port);
//    runApp(MaterialApp(
//      home: QuizScreen(
//        channel: sock,
//      ),
//    ));
//  }

  final Socket channel;

  QuizScreen({Key key, @required this.channel}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  int selectedRadioTile;
  int selectedRadioTileOne;

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  setSelectedRadioTileOne(int val) {
    setState(() {
      selectedRadioTileOne = val;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
    selectedRadioTileOne = 0;
  }

  @override
  void didChangeDependencies() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                )
              : Column(
                  children: <Widget>[
                    StreamBuilder(
                      stream: widget.channel,
                      builder: (context, snapshot) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Text(snapshot.hasData
                              ? '${String.fromCharCodes(snapshot.data)}'
                              : ''),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80, left: 30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Question',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          reverse: true,
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration.collapsed(
                                fillColor: Colors.grey, filled: true),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 450,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Scrollbar(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.white70, width: 1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      elevation: 10,
                                      child: Column(
                                        children: <Widget>[
                                          RadioButtonMC(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
//                  Column(
//                    children: <Widget>[
//                      Container(
//                        height: 450,
//                        width: MediaQuery.of(context).size.width,
//                        child: Padding(
//                          padding: const EdgeInsets.all(8.0),
//                          child: Scrollbar(
//                            child: SingleChildScrollView(
//                              child: Card(
//                                shape: RoundedRectangleBorder(
//                                  side: BorderSide(
//                                      color: Colors.white70, width: 1),
//                                  borderRadius: BorderRadius.circular(20),
//                                ),
//                                elevation: 10,
//                                child: Column(
//                                  children: <Widget>[
//                                    RadioButtonTF(),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        elevation: 15,
                        color: Color(0xFF801E48),
                        child: MaterialButton(
                            minWidth: 200,
                            height: 40,
                            color: Color(0xFF801E48),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: submit),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget RadioButtonMC() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Objective',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 15),
        RadioListTile(
          value: 1,
          groupValue: selectedRadioTile,
          title: Text(
            'A',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          onChanged: (val) {
            print(val);
            setSelectedRadioTile(val);
          },
          activeColor: Colors.grey[800],
          selected: true,
        ),
        RadioListTile(
          value: 2,
          groupValue: selectedRadioTile,
          title: Text(
            'B',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          onChanged: (val) {
            print(val);
            setSelectedRadioTile(val);
          },
          activeColor: Colors.grey[800],
          selected: true,
        ),
        RadioListTile(
          value: 3,
          groupValue: selectedRadioTile,
          title: Text(
            'C',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          onChanged: (val) {
            print(val);
            setSelectedRadioTile(val);
          },
          activeColor: Colors.grey[800],
          selected: true,
        ),
        RadioListTile(
          value: 4,
          groupValue: selectedRadioTile,
          title: Text(
            'D',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          onChanged: (val) {
            setSelectedRadioTile(val);
          },
          activeColor: Colors.grey[800],
          selected: true,
        ),
      ],
    );
  }

  Widget RadioButtonTF() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'True/False',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 15),
        RadioListTile(
          value: 1,
          groupValue: selectedRadioTileOne,
          title: Text(
            'True',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 33,
              color: Colors.black,
            ),
          ),
          onChanged: (val) {
            setSelectedRadioTile(val);
          },
          activeColor: Colors.grey[800],
          selected: true,
        ),
        SizedBox(height: 10),
        RadioListTile(
          value: 2,
          groupValue: selectedRadioTileOne,
          title: Text(
            'False',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 33,
              color: Colors.black,
            ),
          ),
          onChanged: (val) {
            setSelectedRadioTile(val);
          },
          activeColor: Colors.grey[800],
          selected: true,
        ),
      ],
    );
  }

  submit() async {
    //Checks for validation
    if (selectedRadioTile == 0 && selectedRadioTileOne == 0) {
      Fluttertoast.showToast(
          msg: 'Please select an option',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      print('sending to server');
      //TODO: Server code comes here
      // concat strings
      String message = 'Testing the mic. 1-2';
      // send to server //
      widget.channel.write(message + '\n');
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
    }
  }

  @override
  void dispose() {
    widget.channel.close();
    super.dispose();
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//class RadioWidgetDemo extends StatefulWidget {
//  @override
//  _RadioWidgetDemoState createState() => _RadioWidgetDemoState();
//}
//
//class _RadioWidgetDemoState extends State<RadioWidgetDemo> {
//  int selectedRadioTile;
//
//  @override
//  void initState() {
//    super.initState();
//    selectedRadioTile = 0;
//  }
//
//  setSelectedRadioTile(int val) {
//    setState(() {
//      selectedRadioTile = val;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//  }
//}
//
//class RadioWidgetDemoOne extends StatefulWidget {
//  @override
//  _RadioWidgetDemoOneState createState() => _RadioWidgetDemoOneState();
//}
//
//class _RadioWidgetDemoOneState extends State<RadioWidgetDemoOne> {
//  int selectedRadioTileOne;
//
//  @override
//  void initState() {
//    super.initState();
//    selectedRadioTileOne = 0;
//  }
//
//  setSelectedRadioTileOne(int val) {
//    setState(() {
//      selectedRadioTileOne = val;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//  }
//}

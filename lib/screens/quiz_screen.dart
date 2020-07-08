import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

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
  int selectedRadioOption;
  bool isQuestionReceived = false;
  String optionType = '';
  String optionT = '';
  dynamic questionOptions;
  String question = '';
  String answer = '';
  int counter = 0;

  setSelectedRadioOption(int val) {
    setState(() {
      selectedRadioOption = val;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedRadioOption = 0;
  }

  String receivedMessage(String message) {
//CATCH FIRST TIME EXCEPTION
    counter++;
    //.................Split ohhhhh... when you are done spliting, then setState.............//
    if (counter > 2) {
      print('Incoming: ${message.toString()}');
      //split
      dynamic splited = message.split('*#');

      question = splited[0];
      optionT = splited[1];
      answer = splited[2];

      //check optionType to know how to split further
      if (optionT == 'Multiple Choice') {
        questionOptions = question.split('|');
        question = questionOptions[0];
      }

      isQuestionReceived = true;
      optionType = optionT;

      return question.substring(21, question.length);
    } else {
      return 'Connected To Teacher';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
                    child: StreamBuilder(
                      stream: widget.channel,
                      builder: (context, snapshot) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  snapshot.hasData
                                      ? receivedMessage(
                                          String.fromCharCodes(snapshot.data))
                                      : 'Waiting for a question',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
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
                                      width: MediaQuery.of(context).size.width -
                                          20,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Scrollbar(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Colors.white70,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              elevation: 10,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  optionType ==
                                                          'Multiple Choice'
                                                      ? RadioButtonMC()
                                                      : RadioButtonTF(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
                                child: isQuestionReceived
                                    ? MaterialButton(
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
                                        onPressed: submit)
//                                              onPressed: sendBackToServer)
                                    : Container(),
                              ),
                            ),
                          ],
                        );
                      },
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
          groupValue: selectedRadioOption,
          title: Text(
            'A. ' + questionOptions[1],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          onChanged: (val) {
            print(val);
            setSelectedRadioOption(val);
          },
          activeColor: Colors.grey[800],
          selected: true,
        ),
        RadioListTile(
          value: 2,
          groupValue: selectedRadioOption,
          title: Text(
            'B. ' + questionOptions[2],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          onChanged: (val) {
            print(val);
            setSelectedRadioOption(val);
          },
          activeColor: Colors.grey[800],
          selected: true,
        ),
        RadioListTile(
          value: 3,
          groupValue: selectedRadioOption,
          title: Text(
            'C. ' + questionOptions[3],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          onChanged: (val) {
            print(val);
            setSelectedRadioOption(val);
          },
          activeColor: Colors.grey[800],
          selected: true,
        ),
        RadioListTile(
          value: 4,
          groupValue: selectedRadioOption,
          title: Text(
            'D. ' + questionOptions[4],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          onChanged: (val) {
            setSelectedRadioOption(val);
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
          groupValue: selectedRadioOption,
          title: Text(
            'True',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 33,
              color: Colors.black,
            ),
          ),
          onChanged: (val) {
            setSelectedRadioOption(val);
          },
          activeColor: Colors.grey[800],
          selected: true,
        ),
        SizedBox(height: 10),
        RadioListTile(
          value: 2,
          groupValue: selectedRadioOption,
          title: Text(
            'False',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 33,
              color: Colors.black,
            ),
          ),
          onChanged: (val) {
            setSelectedRadioOption(val);
          },
          activeColor: Colors.grey[800],
          selected: true,
        ),
      ],
    );
  }

  sendBackToServer() {
    widget.channel.write('We see you bro');
  }

  submit() async {
    //Checks for validation
    if (selectedRadioOption == 0) {
      Toast.show('Please select an option',context);
    } else {
      //get matric number from sharedPref
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String matric = prefs.getString('matricNumber');
      String name = prefs.getString('name');


      if (optionT == 'True/False') {
        // concat like this
        /*
        *     question*#answer*#matricNo
        * */
        String answer;
        selectedRadioOption == 1 ? answer = 'True' : answer = 'False';
        String message = name + '|' + question + '|' + answer + "|" + matric;
        print('sending to server');
        // send to server //
        widget.channel.write(message + '\n');
        // goes to the previous activity
        Navigator.pop(context);
      } else if (optionT == 'Multiple Choice') {
        // concat like this
        /*
        *     question*#answer*#matricNo
        * */
        String answer = questionOptions[selectedRadioOption];
        String message = name + '|' + question + '|' + answer + "|" + matric;
        print('sending to server');
        // send to server //
        widget.channel.write(message + ' | ' + 'response' + '\n');
        // goes to the previous activity
        Toast.show("Answer Received",context);
        Navigator.pop(context);
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
//  int selectedRadioOption;
//
//  @override
//  void initState() {
//    super.initState();
//    selectedRadioOption = 0;
//  }
//
//  setSelectedRadioOption(int val) {
//    setState(() {
//      selectedRadioOption = val;
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
//  int selectedRadioOptionOne;
//
//  @override
//  void initState() {
//    super.initState();
//    selectedRadioOptionOne = 0;
//  }
//
//  setSelectedRadioOptionOne(int val) {
//    setState(() {
//      selectedRadioOptionOne = val;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//  }
//}

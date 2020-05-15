import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation){
          return orientation == Orientation.portrait? VerLayout() :  HoriLayout();
        },
      ),
    );
  }
}
class RadioWidgetDemo extends StatefulWidget {
  @override
  _RadioWidgetDemoState createState() => _RadioWidgetDemoState();
}

class _RadioWidgetDemoState extends State<RadioWidgetDemo> {

  int selectedRadioTile;
  @override
  void initState(){
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val){
    setState(() {
      selectedRadioTile = val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text('Objective',
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
          title: Text('A',
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
        RadioListTile(
          value: 2,
          groupValue: selectedRadioTile,
          title: Text('B',
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
        RadioListTile(
          value: 3,
          groupValue: selectedRadioTile,
          title: Text('C',
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
        RadioListTile(
          value: 4,
          groupValue: selectedRadioTile,
          title: Text('D',
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
}

class RadioWidgetDemoOne extends StatefulWidget {
  @override
  _RadioWidgetDemoOneState createState() => _RadioWidgetDemoOneState();
}

class _RadioWidgetDemoOneState extends State<RadioWidgetDemoOne> {
  int selectedRadioTileOne;
  @override
  void initState(){
    super.initState();
    selectedRadioTileOne = 0;
  }

  setSelectedRadioTileOne(int val){
    setState(() {
      selectedRadioTileOne = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text('True/False',
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
          title: Text('True',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 33,
              color: Colors.black,
            ),
          ),
          onChanged: (val) {
            setSelectedRadioTileOne(val);
          },
          activeColor: Colors.grey[800],
          selected: true,
        ),
        SizedBox(height: 10),
        RadioListTile(
          value: 2,
          groupValue: selectedRadioTileOne,
          title: Text('False',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 33,
              color: Colors.black,
            ),
          ),
          onChanged: (val) {
            setSelectedRadioTileOne(val);
          },
          activeColor: Colors.grey[800],
          selected: true,
        ),
      ],
    );
  }
}

class VerLayout extends StatefulWidget {
  @override
  _VerLayoutState createState() => _VerLayoutState();
}

class _VerLayoutState extends State<VerLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                width: 400,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration.collapsed(
                        fillColor: Colors.grey,
                        filled: true

                    ),
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
                      height: 350,
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 10,
                          child: Column(
                            children: <Widget>[
                              RadioWidgetDemoOne(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  children: <Widget>[
                    Container(
                      height: 350,
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 10,
                          child: Column(
                            children: <Widget>[
                              RadioWidgetDemo(),

                            ],
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
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HoriLayout extends StatefulWidget {
  @override
  _HoriLayoutState createState() => _HoriLayoutState();
}

class _HoriLayoutState extends State<HoriLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 30),
              child: Align(
                alignment: Alignment.topCenter,
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
                width: 650,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration.collapsed(
                        fillColor: Colors.grey,
                        filled: true

                    ),
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
                      height: 350,
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 10,
                          child: Column(
                            children: <Widget>[
                              RadioWidgetDemoOne(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  children: <Widget>[
                    Container(
                      height: 350,
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 10,
                          child: Column(
                            children: <Widget>[
                              RadioWidgetDemo(),

                            ],
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
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

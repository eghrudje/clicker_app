import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizHistoryScreen extends StatefulWidget {
  @override
  _QuizHistoryScreenState createState() => _QuizHistoryScreenState();
}

class _QuizHistoryScreenState extends State<QuizHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Overview',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w800,
          decorationColor: Colors.black,
        ),
        ),
      ),
    body: Center(child: SwipeList()),
    );
  }
}
class SwipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return ListItemWidget();
  }
}
class ListItemWidget extends State<SwipeList>{
  List items = getDummyList();

  @override
  Widget build(BuildContext context){
    return Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          return Dismissible(
            key: Key(items[index]),
            background: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            onDismissed: (direction){
              setState(() {
                items.removeAt(index);
              });
            },
            direction: DismissDirection.endToStart,
            child: Card(
              elevation: 5,
              child: Container(
                height: 130,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 130,
                      width: 25,
                      decoration: BoxDecoration(
                          color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5),
                        )
                      ),
                    ),
                 Container(
                   height: 100,
                   child: Padding(
                     padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text(
                           'Time/Date'
                         ),
                         Padding(
                           padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                           child: Container(
                             width: 100,
                             decoration: BoxDecoration(
                               color: Colors.blueAccent,
                               border: Border.all(color: Colors.teal),
                               borderRadius: BorderRadius.only(
                                 bottomLeft: Radius.circular(5),
                                 topLeft: Radius.circular(5),
                               )
                             ),
                             child: Center(
                               child: Text(
                                 'Course',
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                   fontSize: 22,
                                   fontWeight: FontWeight.w800,
                                   fontStyle: FontStyle.italic,
                                   color: Colors.white,
                                 ),
                               ),
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.fromLTRB(0, 5, 0, 2),
                           child: Container(
                             height: 45,
                             width: 350,
                             decoration: BoxDecoration(
                               color: Colors.white
                             ),
                             child: Text(
                               'Question',
                               style: TextStyle(
                                 color: Colors.grey[700],
                                 fontStyle: FontStyle.normal,
                                 fontSize: 20,
                                 fontWeight: FontWeight.w400
                               ),
                             ),
                           ),
                         ),
                       ],
                         ),
                   ),
                 ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
      );
  }
  static List getDummyList(){
    List list = List.generate(10, (i){
      return "Item \$(i + 1)";
    });
    return list;
  }
}
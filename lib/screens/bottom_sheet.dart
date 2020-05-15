
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bottomSheet{

  bottomSheet(BuildContext context);

  void settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc){
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new Padding(padding: MediaQuery.of(context).viewInsets,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          onFieldSubmitted: (v){
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          textInputAction: TextInputAction.next,
                          autofocus: true,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: 'Enter IP address:',
                              labelStyle: TextStyle(
                                color: Colors.black54,

                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 5),
                              ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          onFieldSubmitted: (v){
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          textInputAction: TextInputAction.next,
                          autofocus: true,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: 'Enter Port Number:',
                              labelStyle: TextStyle(
                                color: Colors.black54,

                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 5),
                              ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: new FlatButton(
                      onPressed: () {},
                      child: Text('Submit'),
                      textColor: Colors.white,
                      color: Colors.indigoAccent,
                      splashColor: Colors.white.withOpacity(0.5),
                    ),
                  ),

                ],
              ),
            ),
          );
        });
  }
}
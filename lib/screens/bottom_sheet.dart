import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bottomSheet{

  bool _autoValidate = false;
  TextEditingController _ipAddressController = new TextEditingController();
  TextEditingController _portController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                    child: Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _ipAddressController,
                            onFieldSubmitted: (v){
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            textInputAction: TextInputAction.next,
                            autofocus: true,
                            keyboardType: TextInputType.phone,
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
                            validator: (val) {
                              String _validateIpAddress(String value){
                                if(value.isEmpty){
                                  return "Enter IP Address";
                                }
                                String ip = '\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.|\$)){4}\b';
                                RegExp regExp = new RegExp(ip);

                                if(regExp.hasMatch(value)){
                                  return null;
                                }
                                return 'Enter a valid IP Address';
                              }
                              if (val.length == 0) {
                                return 'IP Address Not filled';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _portController,
                            onFieldSubmitted: (v){
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            textInputAction: TextInputAction.next,
                            autofocus: true,
                            keyboardType: TextInputType.phone,
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
                            validator: (val) {
                              if (val.length == 0) {
                                return 'Port Not filled';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: new FlatButton(
                      onPressed: submit,
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
  submit() async {
    //Checks for validation
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('ipAddress', _ipAddressController.text);
      prefs.setString('port', _portController.text);
      print("Sent to sharedpref");
      print('sending to server');
      // concat strings
      String response = "okay";

      if (response == "okay") {
          print('sign up successful');
          //send to sharedpref

      } else {
          print('sign up NOT successful');
//toast an error message to user
      }
    } else {
       _autoValidate = true;
    }
  }

}
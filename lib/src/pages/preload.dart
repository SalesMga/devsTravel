import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import 'dart:async';

class PreloadPage extends StatefulWidget {
  @override
  _PreloadPage createState() => _PreloadPage();
}

class _PreloadPage extends State<PreloadPage> {

  bool loading = true;

  requestInfo() async {
     print(loading);

     await Future.delayed(Duration(seconds: 1));

    setState(() {
      loading = true;
    });

    bool res = await Provider.of<AppData>(context).requestData1();

    if (res) {
      Navigator.pushNamed(context, '/home');
    }else{
     loading = false;
     Navigator.pushNamed(context, '/home');
    }

    setState(() {
      loading = false;
    });
  
  }

  void initSate() {
    super.initState();
    requestInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'lib/assets/flutter1_devstravel_logo.png',
            width: 200,
          ),
          loading
              ? Container(
                  margin: EdgeInsets.all(30),
                  child: Text(
                    'Carregando informações...',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              : Container(),
          loading
              ? CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green))
              : Container(),
          !loading
              ? Container(
                  margin: EdgeInsets.all(30),
                  child: RaisedButton(
                    child: Text("Tentar Novamente"),
                    onPressed: () {},
                  ))
              : Container(),
        ],
      )),
    );
  }
}

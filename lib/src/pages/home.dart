import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: Text('Continentes: ${appdata.data.length}'),
          
        ),
      )
    );
  }
}
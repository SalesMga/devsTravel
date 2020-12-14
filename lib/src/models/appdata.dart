import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppData with ChangeNotifier {
  var data = [];
  var url = 'https://jsonplaceholder.typicode.com/todos/1';

  void setData(newData) {
    data = newData;
    notifyListeners();
  }

  Future<bool> requestData1() async {

    final res = await http.get(url);

    if (res.statusCode == 200) {
      print(res.body);
      setData(jsonDecode(res.body));
      return true;
    } else {
      return false;
      //throw Exception('Failed to load post');
    }
  }
}

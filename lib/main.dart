import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/login.dart';
import 'src/register.dart';


void main() async {
  await Hive.initFlutter();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
    },
  ));
}

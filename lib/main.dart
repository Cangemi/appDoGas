import 'package:conic/view/TelaLogin.dart';
import 'package:conic/view/TelaPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:conic/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final tokenSave = await SharedPreferences.getInstance();
  int? token = tokenSave.getInt('aceite');

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Sensor de Gás',
    home: token == null || token == 0
        ? TelaLogin()
        : TelaPrincipal(
            id: token,
          ),
  ));
}

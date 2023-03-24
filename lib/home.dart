import 'package:flutter/material.dart';
import 'package:conic/view/TelaLogin.dart';
import 'package:conic/view/TelaPrincipal.dart';
import 'package:conic/view/TelaCadastroUsuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? token;
  verificar() async {
    final tokenSave = await SharedPreferences.getInstance();
    token = tokenSave.getInt('aceite');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //verificar();
  }

  @override
  Widget build(BuildContext context) {
    verificar();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sensor de Gás',
      initialRoute: token == null || token == 0 ? '/login' : '/principal',
      routes: {
        '/login': (context) => const TelaLogin(),
        '/principal': (context) => TelaPrincipal(
              id: token,
            ),
        '/usuario': (context) => const TelaCadastroUsuario(),
      },
    );
  }
}

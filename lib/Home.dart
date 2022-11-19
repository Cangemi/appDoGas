import 'package:flutter/material.dart';
import 'package:sensor_gas/model/dispositivo.dart';
import 'package:sensor_gas/repositorio/dispositivo_repositorio.dart';
import 'package:sensor_gas/widgets/mensagem.dart';

class Home extends StatefulWidget {
  final int? id;
  const Home({super.key, this.id});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DispositivoRepositorio dispositivoRepositorio = DispositivoRepositorio();

  List<String> itensMenu = ["Editar Perfil", "Deslogar"];
  List<Widget> widgetList = [];

  _escolhaMenuItem(String itemEscolhido) {
    switch (itemEscolhido) {
      case "Editar Perfil":
        // return Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => TelaPerfil(),
        //     ));
        break;
      case "Deslogar":
        return deslogarUsuario();
        break;
    }
  }

  void deslogarUsuario() async {
    sucesso(context, 'O usuário deslogado!');
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dispositivos"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey.shade300,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _escolhaMenuItem,
            itemBuilder: (context) {
              return itensMenu.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
          )
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: dispositivoRepositorio.recuperarDispositivo(widget.id!),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var lista = snapshot.data;
                  // print(lista[index]["id"]);
                  Dispositivo dispositivo = lista![index];
                  return ListTile(
                    title: Text(dispositivo.id.toString()),
                    subtitle: Text(dispositivo.mac!),
                  );
                });
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

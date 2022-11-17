import 'package:flutter/material.dart';
import 'package:sensor_gas/model/dispositivo.dart';
import 'package:sensor_gas/repositorio/dispositivo_repositorio.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DispositivoRepositorio dispositivoRepositorio = DispositivoRepositorio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: dispositivoRepositorio.recuperarDispositivo(),
        builder: (context,AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var lista = snapshot.data;
                  Dispositivo dispositivo = lista![index];
                  return ListTile(
                    title: Text(dispositivo.nome!),
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

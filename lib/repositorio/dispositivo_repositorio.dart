import 'dart:convert';
import 'package:sensor_gas/model/dispositivo.dart';
import 'package:http/http.dart' as http;

class DispositivoRepositorio {
  String urlBase = "https://gas-sensor-api.herokuapp.com/api";

  Future<List> recuperarDispositivo(int id) async {
    http.Response response = await http.get(Uri.parse("$urlBase/device/$id"));

    if (response.statusCode == 200) {
      var dadosJson = json.decode(response.body);
      return dadosJson.map((json) => Dispositivo.fromJson(json)).toList();
    } else {
      throw Exception('Erro não foi possivel carregar usuarios');
    }
  }
}

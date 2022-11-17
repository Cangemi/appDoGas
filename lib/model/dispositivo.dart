class Dispositivo {
  int? id;
  int? idCliente;
  int? lock;
  String? mac;
  String? nome;

  Dispositivo({this.id, this.idCliente, this.lock, this.mac, this.nome});

  Dispositivo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idCliente = json['idCliente'];
    lock = json['lock'];
    mac = json['mac'];
    nome = json['nome'];
  }
}

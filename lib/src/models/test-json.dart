
class TestJson {
  late int id;
  late String name;
  late int cod;

  TestJson({required this.id, required this.name, required this.cod});

  TestJson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }
  
}
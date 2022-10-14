import 'package:uuid/uuid.dart';

class Despesa {
  final _id = Uuid().v1();
  final String titulo;
  final double valor;

  Despesa({
    required this.titulo,
    required this.valor,
  });

  String get id => _id;

  void printDespesas() {
    print('''
ID: $id
Título: $titulo
Valor: $valor
''');
  }
}

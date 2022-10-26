//import 'package:finances/categoria.dart';
//import 'package:finances/lista_categorias.dart';
import 'package:uuid/uuid.dart';
import 'lista_categorias_despesa.dart';

class Despesa {
  final _id = Uuid().v1();
  final String titulo;
  final double valor;
  //final listaCategorias = <ListaCategoriasDespesa>[];
  final listaCategorias = ListaCategoriasDespesa();

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

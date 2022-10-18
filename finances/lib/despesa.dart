//import 'package:finances/categoria.dart';
//import 'package:finances/lista_categorias.dart';
import 'package:uuid/uuid.dart';

class Despesa {
  final _id = Uuid().v1();
  final String titulo;
  final double valor;
  //final listaCategorias = <ListaCategorias>[];

  Despesa({
    required this.titulo,
    required this.valor,
    //required this.listaCategorias,
  });

  String get id => _id;

  void printDespesas() {
    print('''
ID: $id
Título: $titulo
Valor: $valor
''');
  }
//Categoria: ${listaCategorias.mostrarCategorias()};

}

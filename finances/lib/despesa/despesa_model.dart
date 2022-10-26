//import 'package:finances/categoria.dart';
//import 'package:finances/lista_categorias.dart';
import 'package:uuid/uuid.dart';
// import 'categoria_despesa_controller.dart';

class DespesaModel {
  final _id = Uuid().v1();
  final String titulo;
  final double valor;
  final String criadoPor;
  //final listaCategorias = <ListaCategoriasDespesa>[];
  // final listaCategorias = ControllerCategoriasDespesa();

  DespesaModel({
    required this.titulo,
    required this.valor,
    required this.criadoPor,
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

 import 'dart:io';
 import 'categoria.dart';


class CategoriaController{
final listaDeCategorias = <Categoria>[];

  void opcoes(){
     print('''
        Digite as opções referentes à categorias:
        1) Adcionar categoria;
        2) Buscar uma categoria;
        3) Excluir categoria;
        4) Mostrar todas as categorias;
        0) Sair;
        ''');

    String input = stdin.readLineSync()!;
  }

  void adicionarCategoria() {
    print('Digite uma categoria para seus ganhos:');
    String nomeCategoria = stdin.readLineSync()!;
    final categoria = Categoria(nomeCategoria: nomeCategoria);
    listaDeCategorias.add(categoria);
  }

  Categoria? buscarCategoria() {
    print('Digite a categoria que deseja:');
    String nomeCategoria = stdin.readLineSync()!;

    final exists = listaDeCategorias.any((element) => element.nomeCategoria == nomeCategoria);
    if (!exists) {
      print(exists);
      return null;
    }

    final categoria = listaDeCategorias.firstWhere((element) => element.nomeCategoria == nomeCategoria);

    print('Categoria: ${categoria.nomeCategoria}');
    return categoria;
  }

  void excluirCategoria() {
    print('Digite a categoria que deseja excluir');
    String nomeCategoria = stdin.readLineSync()!;
    for (var element in listaDeCategorias) {
      if (element.nomeCategoria == nomeCategoria) {
        final Categoria = listaDeCategorias.remove(nomeCategoria);
        print(listaDeCategorias);
      }
    }
  }

  void registroDeCategorias() {
    print('Registro de Categorias cadastradas:');
    for (var element in listaDeCategorias) {
      print('''
      categoria: ${element.nomeCategoria}
      ''');
    }
  }
}
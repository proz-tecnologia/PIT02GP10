import 'dart:io';
import 'categoria_modelo.dart';
import 'package:finances/categorias/categoria_menu.dart';

class CategoriaController {
  final listaDeCategorias = <Categoria>[];

  void mostrarMenu() {
    print('''
        Digite as opções referentes à categorias:
        1) Adcionar categoria;
        2) Buscar uma categoria;
        3) Excluir categoria;
        4) Mostrar todas as categorias;
        0) Sair;
        ''');
  }

  void adicionarCategoria(Categoria categoria) {
    listaDeCategorias.add(categoria);
  }

  Categoria? buscarCategoria(String nomeCategoria) {
    final exists = listaDeCategorias
        .any((element) => element.nomeCategoria == nomeCategoria);
    if (!exists) {
      print(exists);
      return null;
    }

    final categoria = listaDeCategorias
        .firstWhere((element) => element.nomeCategoria == nomeCategoria);

    print('Categoria: ${categoria.nomeCategoria}');
    return categoria;
  }

  void excluirCategoria(String nomeCategoria) {
    print(listaDeCategorias[0].hashCode);

    for (final categoria in listaDeCategorias) {
      print(categoria.toString());
    }

    print(nomeCategoria);

    for (var element in listaDeCategorias) {
      if (element.nomeCategoria == nomeCategoria) {
        final index = listaDeCategorias.indexWhere(
          (element) => element.nomeCategoria == nomeCategoria,
        );
        listaDeCategorias.removeAt(index);
        break;
      }
    }
    for (final categoria in listaDeCategorias) {
      print(categoria.toString());
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

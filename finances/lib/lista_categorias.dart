import 'categoria.dart';

class ListaCategorias {
  final listaCategorias = <Categoria>[];

  void adicionarCategoria(Categoria categoria) {
    listaCategorias.add(categoria);
  }

  void mostrarCategorias() {
    print("Lista de Categorias cadastradas:");
    for (var element in listaCategorias) {
      element.printCategorias();
    }
  }

  bool verificaListaCategorias() {
    if (listaCategorias.isEmpty) {
      print("Não existe lista de Categorias.");
      return false;
    } else {
      return true;
    }
  }

  void buscarCategoria(String categoria) {
    if (verificaListaCategorias() == false) {
      return;
    } else {
      for (var element in listaCategorias) {
        if (element.categoria == categoria) {
          element.printCategorias();
        } else {
          print("Categoria não encontrada.");
        }
      }
    }
  }

  void excluirCategoria(String categoria) {}
}

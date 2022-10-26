import 'despesa.dart';

class ListaDespesas {
  final listaDespesas = <Despesa>[];

  void adicionarDespesa(String titulo, String valor) {
    final despesa = Despesa(
      titulo: titulo,
      valor: double.parse(valor),
    );
    listaDespesas.add(despesa);
  }

  void mostrarDespesas() {
    print("Lista de despesas cadastradas:");
    for (var despesa in listaDespesas) {
      despesa.printDespesas();
    }
  }

  bool verificaListaDespesas() {
    if (listaDespesas.isEmpty) {
      print("Não existe lista de despesas.");
      return false;
    } else {
      return true;
    }
  }

  Despesa? buscarDespesaID(String id) {
    if (verificaListaDespesas() == false) {
      return null;
    } else {
      final resultado = listaDespesas.any((element) => element.id == id);
      if (!resultado) return null;
      final resultado2 =
          listaDespesas.firstWhere((element) => element.id == id);
      return resultado2;
    }
  }

  void buscarDespesaTitulo(String titulo) {
    if (verificaListaDespesas() == false) {
      return;
    } else {
      for (var despesa in listaDespesas) {
        if (despesa.titulo == titulo) {
          despesa.printDespesas();
        } else {
          print("Título não encontrado.");
        }
      }
    }
  }

/*
  void buscarDespesaCategoria(String categoria) {
    if (verificaListaDespesas() == false) {
      return;
    } else {
      for (var despesa in listaDespesas) {
        if (despesa.categoria == categoria) {
          despesa.printDespesas();
        } else {
          print("Categoria não encontrada.");
        }
      }
    }
  */
  void excluirDespesa(String id) {
    bool isfound = false;
    for (var despesa in listaDespesas) {
      if (despesa.id == id) {
        listaDespesas.remove(despesa);
        print("${despesa.titulo} removida.");
        isfound = true;
        break;
      }
    }
    if (!isfound) print("Despesa não encontrada.");
  }
}

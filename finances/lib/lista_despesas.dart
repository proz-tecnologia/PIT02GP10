import 'despesa.dart';

class ListaDespesas {
  final listaDespesas = <Despesa>[];

  void adicionarDespesa(Despesa despesa) {
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

  void buscarDespesaID(String id) {
    if (verificaListaDespesas() == false) {
      return;
    } else {
      for (var despesa in listaDespesas) {
        if (despesa.id == id) {
          despesa.printDespesas();
        } else {
          print("ID não encontrado.");
        }
      }
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
    try {
      for (var despesa in listaDespesas) {
        if (despesa.id == id) {
          listaDespesas.remove(despesa);
          print("${despesa.titulo} removida.");
        }
      }
      print("Despesa não encontrada.");
    } catch (e) {
      //TODO Só assim funciona sem crashar, não sei porque
    }
  }
}

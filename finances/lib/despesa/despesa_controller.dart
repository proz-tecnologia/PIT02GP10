import 'despesa_model.dart';

//era lista de despesas, virou controller_despesa.dart
class ControllerDespesa {
  final listaDespesas = <DespesaModel>[];

  void adicionarDespesa(String titulo, String valor) {
    final despesa = DespesaModel(
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
/*
  Despesa? buscarDespesaID(String id) {
    if (verificaListaDespesas() == false) {
      print("lista vazia");
      return null;
    } else {
      final resultado = listaDespesas.any((element) => element.id == id);
      if (!resultado) {
        print("nao achou id");
        return null;
      }
      final resultado2 =
          listaDespesas.firstWhere((element) => element.id == id);
      print('''
      ID: ${resultado2.id}
      Título: ${resultado2.titulo}
      Valor: ${resultado2.valor} 
      ''');
      return resultado2;
    }
  }
*/

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

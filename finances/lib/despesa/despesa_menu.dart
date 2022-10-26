import 'dart:io';
import 'package:finances/despesa/despesa_controller.dart';

class DespesaMenu {
  final ControllerDespesa controllerDespesa;

  DespesaMenu({
    required this.controllerDespesa,
  });

  void iniciarDespesas() {
    while (true) {
      stdout.write('''
      Escolha uma opção:
      1) Cadastrar uma nova despesa
      2) Buscar uma despesa por ID
      3) Buscar uma despesa por título
      4) Buscar uma despesa por categoria
      5) Mostrar todas as despesas
      6) Excluir uma despesas
      0) Encerrar programa
      ''');

      final opcao = stdin.readLineSync()!;

      print("\x1B[2J\x1B[0;0H");

      if (opcao == "0") break;

      switch (opcao) {
        case "1":
          print("Adição de nova despesa");
          print("Digite o título da despesa:");
          String titulo = stdin.readLineSync()!;
          print("Digite o valor da despesa:");
          String valor = stdin.readLineSync()!;
          controllerDespesa.adicionarDespesa(titulo, valor);
          break;
        case "2":
          print("Digite o ID da despesa a ser pesquisada");
          String id = stdin.readLineSync()!;
          controllerDespesa.buscarDespesaID(id);
          break;
        case "3":
          print("Digite o título da despesa a ser pesquisada");
          String titulo = stdin.readLineSync()!;
          controllerDespesa.buscarDespesaTitulo(titulo);
          break;
        case "4":
          print("Digite a categoria da despesa a ser pesquisada");
          //TODO Implementar
          break;
        case "5":
          controllerDespesa.mostrarDespesas();
          break;
        case "6":
          print("Digite o ID da despesa que deseja excluir");
          String id = stdin.readLineSync()!;
          controllerDespesa.excluirDespesa(id);
          break;
        default:
          print("Opção Inválida. Tente novamente");
      }
    }
  }
}

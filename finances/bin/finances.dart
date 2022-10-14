import 'dart:io';
import 'package:finances/despesa.dart';
import 'package:finances/lista_despesas.dart';

void main(List<String> arguments) {
  final listaDespesas = ListaDespesas();

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
        final despesa = Despesa(titulo: titulo, valor: double.parse(valor));
        listaDespesas.adicionarDespesa(despesa);
        break;
      case "2":
        print("Digite o ID da despesa a ser pesquisada");
        break;
      case "3":
        print("Digite o título da despesa a ser pesquisada");
        break;
      case "4":
        print("Digite a categoria da despesa a ser pesquisada");
        break;
      case "5":
        listaDespesas.mostrarDespesas();
        break;
      case "6":
        print("Digite o ID da despesa que deseja excluir");
        break;
      default:
        print("Opção Inválida. Tente novamente");
    }
  }
}

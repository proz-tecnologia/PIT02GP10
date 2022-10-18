import 'dart:io';
import 'package:finances/ganho.dart';
import 'package:finances/lista_ganhos.dart';
import 'package:uuid/uuid.dart';

class Controller {
  final listaDeGanhos = <Ganho>[];

  void adicionarGanho() {
    print('Digite o título do ganho:');
    String titulo = stdin.readLineSync()!;
    print('Digite o valor do novo ganho:');
    String valor = stdin.readLineSync()!;
    final ganho = Ganho(titulo: titulo, valor: double.parse(valor));
    listaDeGanhos.add(ganho);
  }

  Ganho? buscarGanhoId() {
    print('Digite o ID do ganho:');
    String id = stdin.readLineSync()!;

    final exists = listaDeGanhos.any((element) => element.id == id);
    if (!exists) {
      print(exists);
      return null;
    }

    final ganho = listaDeGanhos.firstWhere((element) => element.id == id);

    print('''
      ID: ${ganho.id}
      Título: ${ganho.titulo}
      Valor: ${ganho.valor} 
      ''');
    return ganho;
  }

  Ganho? buscarGanhoTitulo() {
    print('Digite o Titulo do ganho:');
    String titulo = stdin.readLineSync()!;

    final exists = listaDeGanhos.any((element) => element.titulo == titulo);
    if (!exists) {
      print(exists);
      return null;
    }

    final ganho = listaDeGanhos.where((element) => element.titulo == titulo);

   /* print('''
      ID: ${ganho.id}
      Título:${ganho.titulo}
      Valor: ${ganho.valor}
      ''');
    return ganho;*/
  }

  void registroDeGanhos() {
    print('Registro de ganhos:');
    for (var element in listaDeGanhos) {
      print('''
      ID: ${element.id}
      Título: ${element.titulo}
      Valor: ${element.valor} 
      ''');
    }
  }


}

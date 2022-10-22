import 'dart:io';
import 'package:finances/ganhos/ganho.dart';
import 'package:uuid/uuid.dart';

class ControllerGanho {
  final listaDeGanhos = <Ganho>[];

  void adicionarGanho(Ganho ganho) {
    listaDeGanhos.add(ganho);
  }

  Ganho? buscarGanhoId(String id) {
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

  List<Ganho>? buscarGanhoTitulo(String titulo) {
    final exists = listaDeGanhos.any((element) => element.titulo == titulo);
    if (!exists) {
      print(exists);
      return null;
    }

    final ganho =
        listaDeGanhos.where((element) => element.titulo == titulo).toList();

    ganho.forEach((element) {
      print('''
      ID: ${element.id}
      Título:${element.titulo}
      Valor: ${element.valor}
      ''');
    });

    return ganho;
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

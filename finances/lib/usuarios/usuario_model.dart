import 'dart:convert';

import 'package:uuid/uuid.dart';

class UsuarioModel {
  final String id = Uuid().v1();
  final String nome;
  final String email;
  final String telefone;
  final String senha;

  UsuarioModel({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'senha': senha,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      telefone: map['telefone'] ?? '',
      senha: map['senha'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) =>
      UsuarioModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UsuarioModel(id: $id, nome: $nome, email: $email, telefone: $telefone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UsuarioModel &&
        other.nome == nome &&
        other.email == email &&
        other.telefone == telefone &&
        other.senha == senha;
  }

  @override
  int get hashCode {
    return nome.hashCode ^ email.hashCode ^ telefone.hashCode ^ senha.hashCode;
  }
}

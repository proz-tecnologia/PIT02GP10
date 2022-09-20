import 'package:finances/models/object_id.dart';

class WalletModel extends ObjectId {
  final List<String> transactionsIds = [];
  final double balance;

  WalletModel({
    required super.id,
    required this.balance,
    required super.createdAt,
  });
}

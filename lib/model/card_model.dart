import 'package:eran_by_saving/constants/card_constant.dart';

class CardModel {
  final CARD card;
  final String name;
  final String nro;
  final String nroCCI;
  final double amount;

  CardModel({
    required this.card,
    required this.name,
    required this.nro,
    required this.nroCCI,
    required this.amount,
  });
}

import 'package:eran_by_saving/constants/card_constant.dart';
import 'package:eran_by_saving/model/card_user_model.dart';

class CardModel {
  final CARD card;
  final String name;
  final String nro;
  final String nroCCI;
  final double amount;
  final String id;
  final String currency;
  final status = true;
  final CardUserModel owner;
  final List<CardUserModel> guests;

  CardModel({
    required this.card,
    required this.name,
    required this.nro,
    required this.nroCCI,
    required this.amount,
    required this.id,
    required this.currency,
    required this.owner,
    required this.guests,
  });
}

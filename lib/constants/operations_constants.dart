// ignore_for_file: constant_identifier_names

enum OPERATION { transfer, pay }

enum CURRENCY { PEN, USD }

extension CURRENCYExt on CURRENCY {
  String get toSimbol {
    if (this == CURRENCY.USD) return "\$";
    return "S./";
  }
}

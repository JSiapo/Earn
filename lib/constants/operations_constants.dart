// ignore_for_file: constant_identifier_names

enum OPERATION { transfer, pay }

enum CURRENCY { PEN, USD }

extension CURRENCYExt on CURRENCY {
  String get toSymbol {
    if (this == CURRENCY.USD) return "\$";
    return "S./";
  }
}

extension StringCURRENCYExt on String {
  CURRENCY get toSymbol {
    if (this == "S./") return CURRENCY.PEN;
    return CURRENCY.USD;
  }
}

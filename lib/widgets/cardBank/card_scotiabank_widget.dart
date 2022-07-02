import 'package:flutter/material.dart';

class CardCurvoScotiaBank extends StatelessWidget {
  const CardCurvoScotiaBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(221, 15, 23, 1),
            Color.fromRGBO(254, 42, 49, 1),
            Color.fromRGBO(221, 15, 23, 1),
          ],
        ),
      ),
    );
  }
}

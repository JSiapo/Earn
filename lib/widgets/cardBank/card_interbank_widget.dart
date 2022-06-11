import 'package:flutter/material.dart';

class CardCurvoInterBank extends StatelessWidget {
  const CardCurvoInterBank({Key? key}) : super(key: key);
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
            Color.fromRGBO(92, 205, 93, 1),
            Color.fromRGBO(11, 84, 164, 1),
          ],
        ),
      ),
    );
  }
}

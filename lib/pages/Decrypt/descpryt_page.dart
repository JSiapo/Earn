import 'package:eran_by_saving/pages/base.dart';
import 'package:flutter/material.dart';

class DecryptPage extends StatelessWidget with BasePage {
  const DecryptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Descifrando datos ...'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:eran_by_saving/provider/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  String setTitle() {
    return "Home Basic";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(setTitle()),
        ),
        body: Center(
          child: Consumer<HomeProvider>(
            builder: (context, data, _) {
              return ElevatedButton(
                  onPressed: () {
                    data.toogleTheme();
                  },
                  child: Text(setTitle()));
            },
          ),
        ));
  }
}

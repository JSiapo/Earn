import 'package:eran_by_saving/pages/Home/home_page_abstract.dart';
import 'package:eran_by_saving/widgets/common/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:eran_by_saving/provider/home_provider.dart';

class HomePage extends StatelessWidget with HomePageAbstract {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(setTitle()),
        ),
        body: Center(
          child: Consumer<HomeProvider>(
            builder: (context, data, _) {
              return FancyButton(
                callback: () {
                  data.toogleTheme();
                },
                text: setTitle(),
              );
            },
          ),
        ));
  }

  @override
  String setTitle() {
    return "Home Basic";
  }
}

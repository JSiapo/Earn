import 'package:eran_by_saving/pages/Home/home_page_abstract.dart';
import 'package:eran_by_saving/widgets/cardBank/card_list_widget.dart';
import 'package:eran_by_saving/widgets/common/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:eran_by_saving/provider/home_provider.dart';

class HomePage extends StatelessWidget with HomePageAbstract {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.grey[800],
            statusBarIconBrightness:
                Brightness.light, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Consumer<HomeProvider>(
              builder: (context, data, _) {
                return Column(
                  children: [
                    FancyButton(
                      callback: () {
                        data.toogleTheme();
                      },
                      text: "PAGE: ${data.indexCard}",
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        constraints:
                            const BoxConstraints(maxHeight: 250, maxWidth: 300),
                        height: 220,
                        width: 300,
                        child: CardList(data.indexCard),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ));
  }

  @override
  String setTitle() {
    return "Home Basic";
  }
}

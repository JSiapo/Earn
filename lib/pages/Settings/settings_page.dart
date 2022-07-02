import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/route/routes.dart';
import 'package:eran_by_saving/widgets/common/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Consumer<HomeProvider>(
        builder: (context, data, _) => ListView(
          children: [
            AdaptativeButton(
              callback: () {
                data.toogleTheme();
              },
              text: "PAGE: ${data.indexPage}",
            ),
            AdaptativeButton(
              callback: () {
                goBack(context);
              },
              text: "BACK",
            ),
          ],
        ),
      ),
    );
  }
}

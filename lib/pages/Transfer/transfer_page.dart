import 'package:eran_by_saving/pages/Error/error_page.dart';
import 'package:eran_by_saving/pages/Loading/loading_page.dart';
import 'package:eran_by_saving/provider/error_provider.dart';
import 'package:eran_by_saving/provider/loading_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransferPage extends StatelessWidget {
  final Widget child;
  const TransferPage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child,
      Consumer<LoadingProvider>(builder: (context, data, _) {
        if (data.isLoading) return const LoadingPage();
        return Container();
      }),
      Consumer<ErrorProvider>(builder: (context, data, _) {
        if (data.errors.isNotEmpty) return const ErroPage();
        return Container();
      }),
    ]);
  }
}

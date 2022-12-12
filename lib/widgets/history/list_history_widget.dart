import 'package:dio/dio.dart';
import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/provider/card_provider.dart';
import 'package:eran_by_saving/provider/error_provider.dart';
import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/provider/operations_provider.dart';
import 'package:eran_by_saving/route/routes.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:eran_by_saving/utils/show_bottom_alert.dart';
import 'package:eran_by_saving/widgets/history/item_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({Key? key}) : super(key: key);

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<OperationProvider>()
          .findOperationsFiltered(context.read<CardProvider>().card?.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(builder: (context, cardData, _) {
      return RefreshIndicator(
        onRefresh: () async {
          try {
            await Future.wait([
              context.read<CardProvider>().refresh(context),
              context.read<OperationProvider>().refresh(),
            ]);
            await context
                .read<OperationProvider>()
                .findOperationsFiltered(cardData.card?.id);
          } on DioError catch (e) {
            context.read<ErrorProvider>().addError(e.message, isBackPage: true);
            goTo(context, PAGES.errorPage.route);
          } catch (e) {
            context.read<ErrorProvider>().addError("$e", isBackPage: true);
            goTo(context, PAGES.errorPage.route);
          }
        },
        child: context.watch<OperationProvider>().operationsFiltered.isEmpty
            ? Stack(
                children: [
                  ListView(),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: getIconWidget(IconsAvailables.empty),
                        ),
                        const Text('No se encontraron operaciones')
                      ],
                    ),
                  ),
                ],
              )
            : ListView.builder(
                //physics: const BouncingScrollPhysics(),
                itemCount: context
                    .watch<OperationProvider>()
                    .operationsFiltered
                    .length,
                itemBuilder: (BuildContext context, int index) {
                  return HistoryItem(
                    operation: context
                        .watch<OperationProvider>()
                        .operationsFiltered[index],
                  );
                },
              ),
      );
    });
  }
}

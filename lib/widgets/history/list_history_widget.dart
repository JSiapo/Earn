import 'package:eran_by_saving/provider/card_provider.dart';
import 'package:eran_by_saving/provider/operations_provider.dart';
import 'package:eran_by_saving/widgets/history/item_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          await Future.wait([
            Future.delayed(const Duration(milliseconds: 1500)),
            context.read<CardProvider>().refresh(),
            context.read<OperationProvider>().refresh(),
          ]);
          await context
              .read<OperationProvider>()
              .findOperationsFiltered(cardData.card?.id);
        },
        child: context.watch<OperationProvider>().operationsFiltered.isEmpty
            ? Stack(
                children: [
                  ListView(),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 18),
                          child: FaIcon(FontAwesomeIcons.cloudMeatball),
                        ),
                        Text('No se encontraron operaciones')
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

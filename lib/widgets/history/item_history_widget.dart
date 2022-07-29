import 'package:eran_by_saving/constants/operations_constants.dart';
import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/ext/string_ext.dart';
import 'package:eran_by_saving/model/operation_model.dart';
import 'package:eran_by_saving/provider/operations_provider.dart';
import 'package:eran_by_saving/route/routes.dart';
import 'package:eran_by_saving/utils/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class HistoryItem extends StatelessWidget {
  final Operation operation;
  const HistoryItem({Key? key, required this.operation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (ctx) {},
            backgroundColor: Colors.green[700]!,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Editar',
          ),
          SlidableAction(
            onPressed: (ctx) {
              confirmDialog(context, () async {
                Navigator.pop(context);
              }, () async {
                Navigator.pop(context);
              },
                  title: "OPERACIÓN",
                  message: "¿Seguro desea eliminar ésta operación?");
            },
            backgroundColor: Colors.red[700]!,
            foregroundColor: Colors.white,
            icon: Icons.delete_forever,
            label: 'Eliminar',
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          context.read<OperationProvider>().setOperation(operation);
          goTo(context, PAGES.receiptPage.route);
        },
        leading: FaIcon(operation.isOffline
            ? "cloudArrowUp".toIcon
            : operation.icon.toIcon),
        title: Text(operation.name),
        subtitle: Text(
          operation.dateStr,
          style: const TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
        trailing: Text(
          "${operation.currency.toSimbol} ${operation.mount.toStringAsFixed(2)}",
          style: TextStyle(
            color: operation.isExpense ? Colors.red : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

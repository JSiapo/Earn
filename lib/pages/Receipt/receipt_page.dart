import 'package:cached_network_image/cached_network_image.dart';
import 'package:eran_by_saving/constants/operations_constants.dart';
import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/provider/operations_provider.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:eran_by_saving/utils/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class ReceiptPage extends StatelessWidget with BasePage {
  const ReceiptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentOperation =
        context.watch<OperationProvider>().currentOperation!;
    return Scaffold(
      appBar: getclearAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: currentOperation.isOffline
                      ? getIconWidget(
                          IconsAvailables.values.byName("cloudArrowUp"))
                      : getIconWidget(
                          IconsAvailables.values.byName(currentOperation.icon)),
                ),
                const SizedBox(height: 15),
                Text(
                  currentOperation.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 1.5,
                ),
                const SizedBox(height: 15),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    currentOperation.operation == OPERATION.pay
                        ? "Pago de servicio"
                        : "Transferencia",
                    style: const TextStyle(
                      fontStyle: FontStyle.normal,
                    ),
                    textScaleFactor: 1.1,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "${currentOperation.currency.toSymbol} ${currentOperation.mount.toStringAsFixed(2)}",
                  style: TextStyle(
                    color:
                        currentOperation.isExpense ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 1.5,
                ),
                const SizedBox(height: 15),
                Text(
                  currentOperation.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontStyle: FontStyle.normal,
                  ),
                  textScaleFactor: 1.1,
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: ListView(
                      children: [
                        ListTile(
                          title: const Text('Fecha'),
                          trailing: Text(currentOperation.dateStr),
                        ),
                        ListTile(
                          title: const Text('Categoría'),
                          trailing: Text(
                            currentOperation.operation == OPERATION.pay
                                ? "Pago de servicio"
                                : "Transferencia",
                          ),
                        ),
                        ListTile(
                          title: const Text('ID'),
                          trailing:
                              Text('#${currentOperation.id.substring(31)}'),
                        ),
                        ListTile(
                          title: const Text('Nro. de cuenta'),
                          trailing: Text(currentOperation.accountNumber),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    flex: 1,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: currentOperation.evidence
                          .map(((e) => EvidenceImage(image: e)))
                          .toList(),
                    ),
                  ),
                  // ElevatedButton(
                  //   child: const Text('text'),
                  //   onPressed: () {},
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EvidenceImage extends StatelessWidget {
  final String image;
  const EvidenceImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return GestureDetector(
      onTap: () {
        showCustomDialog(
            context,
            PhotoView(
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.contained * 1.8,
              imageProvider: CachedNetworkImageProvider(
                image,
              ),
            ),
            size: responsive.hp(70));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: image,
          ),
        ),
      ),
    );
  }
}

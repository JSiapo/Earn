import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:eran_by_saving/utils/show_bottom_alert.dart';
import 'package:eran_by_saving/widgets/cardBank/add_card_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class AddCardPage extends StatelessWidget with BasePage {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await scanQr(context);
            },
            child: getIconWidget(IconsAvailables.qrcode)),
        appBar: getclearAppBar(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [Expanded(child: FormAddCard())],
        ));
  }
}

Future<void> scanQr(BuildContext context) async {
  String qr = await scanResult();
  if (qr.isUuid) {
    showSnackBar(context, qr);
  } else {
    showSnackBar(context, "No se recibio codigo");
  }
}

Future<String> scanResult() async {
  try {
    String scanResult = await FlutterBarcodeScanner.scanBarcode(
        "#f6d15f", "Cancelar", true, ScanMode.QR);
    return scanResult;
  } catch (e) {
    return "";
  }
}

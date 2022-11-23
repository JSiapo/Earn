import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:eran_by_saving/utils/two_decimals.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget with BasePage {
  const TransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      appBar: getclearAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              inputFormatters: [
                DecimalTextInputFormatter(decimalRange: 2),
              ],
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                  prefix: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: getIconWidget(IconsAvailables.moneyBill,
                        color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Text('Monto'),
                  hintText: '0.00'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese monto inicial de cuenta';
                }
                return null;
              },
            ),
            SizedBox(height: responsive.hp(3.3)),
          ],
        ),
      ),
    );
  }
}

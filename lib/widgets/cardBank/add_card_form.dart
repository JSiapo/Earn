import 'package:eran_by_saving/constants/operations_constants.dart';
import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/utils/confirm_dialog.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:eran_by_saving/utils/two_decimals.dart';
import 'package:eran_by_saving/widgets/cardBank/card_bbva_debit_widget.dart';
import 'package:eran_by_saving/widgets/cardBank/card_bcp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormAddCard extends StatefulWidget {
  const FormAddCard({Key? key}) : super(key: key);

  @override
  State<FormAddCard> createState() => _FormAddCardState();
}

class _FormAddCardState extends State<FormAddCard> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    constraints: const BoxConstraints(
                        // maxHeight: 350, maxWidth: 450),
                        maxHeight: 750,
                        maxWidth: 450),
                    height: responsive.isLandscape
                        ? responsive.hp(75)
                        : responsive.hp(25), // 25
                    width: responsive.wp(75),
                    child: PageView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const CardCurvoBCPCredimas()),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const CardCurvoBBVADebit()),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: responsive.hp(3.3)),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp('[A-Za-z0-9 -ñÑ]')),
                  ],
                  decoration: InputDecoration(
                      prefix: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: getIconWidget(IconsAvailables.pen,
                            color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: const Text('Descripción de cuenta'),
                      hintText: 'BCP - Cuenta de ahorro en soles'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese descripción de la cuenta';
                    }
                    return null;
                  },
                ),
                SizedBox(height: responsive.hp(3.3)),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[-0-9]')),
                  ],
                  decoration: InputDecoration(
                      prefix: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: getIconWidget(IconsAvailables.creditCard,
                            color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: const Text('Número de cuenta'),
                      hintText: 'XXXXX-XXX-XXX-XXXXXXX'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese número de cuenta';
                    }
                    return null;
                  },
                ),
                SizedBox(height: responsive.hp(3.3)),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[-0-9]')),
                  ],
                  decoration: InputDecoration(
                      prefix: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: getIconWidget(IconsAvailables.creditCard,
                            color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: const Text('Número de cuenta interbancaria'),
                      hintText: 'XXXXX-XXX-XXX-XXXXXXX'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese número de cuenta interbancaria';
                    }
                    return null;
                  },
                ),
                SizedBox(height: responsive.hp(3.3)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 80.75,
                        width: responsive.wp(25),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<CURRENCY>(
                              borderRadius: BorderRadius.circular(10),
                              value: CURRENCY.PEN,
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: [
                                DropdownMenuItem(
                                  value: CURRENCY.PEN,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(CURRENCY.PEN.toSymbol),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: CURRENCY.USD,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(CURRENCY.USD.toSymbol),
                                  ),
                                ),
                              ],
                              onChanged: (item) {}),
                        )),
                    SizedBox(
                      height: 80.75,
                      width: responsive.wp(60),
                      child: TextFormField(
                        inputFormatters: [
                          DecimalTextInputFormatter(decimalRange: 2),
                        ],
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
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
                    ),
                  ],
                ),
                SizedBox(height: responsive.hp(3.3)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 20,
                    surfaceTintColor:
                        context.read<HomeProvider>().settings.isDark
                            ? const Color.fromARGB(255, 21, 21, 21)
                            : const Color.fromARGB(255, 255, 255, 247),
                  ),
                  onPressed: () {
                    //* Remove focus
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState != null) {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        confirmDialog(context, () {
                          Navigator.pop(context);
                        }, () {
                          Navigator.pop(context);
                        },
                            title: "TARJETA",
                            message: "¿Desea agregar ésta tarjeta?");
                      }
                    }
                  },
                  child: SizedBox(
                    width: responsive.wp(45),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text('Registrar',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(fontSize: 18)),
                    ),
                  ),
                ),
                SizedBox(height: responsive.hp(3.3)),
              ],
            ),
          )),
    );
  }
}

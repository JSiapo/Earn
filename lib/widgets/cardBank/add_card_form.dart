import 'package:eran_by_saving/utils/confirm_dialog.dart';
import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              ElevatedButton(
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
                child: const Text('Submit'),
              ),
            ],
          )),
    );
  }
}

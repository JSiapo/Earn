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
                      var alert = AlertDialog(
                        title: const Text("AlertDialog"),
                        content: const Text(
                            "Would you like to continue learning how to use Flutter alerts?"),
                        actions: [
                          MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('SI')),
                          MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('NO')),
                        ],
                      );
                      // show the dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
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

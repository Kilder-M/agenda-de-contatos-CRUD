import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_contato_db/app/views/contact_form.dart';

import 'contact_list.dart';

class MyApp extends StatelessWidget {
  static const CONTACT_FORM = 'contact_form';
  static const HOME = '/';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      routes: {
        CONTACT_FORM: (context) => ContactForm(),
        HOME: (context) => ContactList(),
      },
    );
  }
}

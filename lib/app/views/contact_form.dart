import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'contact_form_back.dart';

class ContactForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    var _back = ContactFormBack(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            _form.currentState.validate();
            _form.currentState.save();
            if(_back.isValid){
              _back.save();
              Navigator.of(context).pop();
             
            }

          }, icon: Icon(Icons.save))
        ],
        title: Text('Cadastro Contatos'),),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldNome(_back),
              fieldEmail(_back),
              fieldPhone(_back),
              fieldUrlPhoto(_back)
            ],

          ),
          
          
          ),
        ),
    );
    
  }

}

Widget fieldNome(ContactFormBack back){
  return TextFormField(
    onSaved: (value) => back.contato.nome = value,
    validator: back.validateName,
    initialValue: back.contato.nome,
    decoration: InputDecoration(
      labelText: 'Nome:',

    ),
  );
}

Widget fieldPhone(ContactFormBack back){
  var mask = MaskTextInputFormatter(mask: '(##) # ####-####');
  return TextFormField(
    onSaved: (value) => back.contato.telefone = value,
    validator: back.validatePhone,
    initialValue: back.contato.telefone,
    inputFormatters: [mask],
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      hintText: '(99) 9 9999-9999',
      labelText: 'Telefone:',
      
      
    ),
  );
}

Widget fieldEmail(ContactFormBack back){
  return TextFormField(
    onSaved: (value) => back.contato.email = value,
    validator: back.validateEmail,
    initialValue: back.contato.email,
    decoration: InputDecoration(
      hintText: 'exemplo@exemplo.com',
      labelText: 'Email:',
      
      
    ),
  );
}

Widget fieldUrlPhoto(ContactFormBack back){
  return TextFormField(
    onSaved: (value) => back.contato.urlAvatar = value,
    initialValue: back.contato.urlAvatar,
    decoration: InputDecoration(
      hintText: 'http://www.exemplo.com',
      labelText: 'Endereço da Foto:',
      
    ),
  );
}
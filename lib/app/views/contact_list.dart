import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lista_contato_db/app/domain/entities/contact.dart';
import 'package:lista_contato_db/app/views/contact_list_back.dart';


class ContactList extends StatelessWidget {
    final _back = ContactListBack();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Contatos'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _back.goToForm(context);
              },
            )
          ],
        ),
        body: Observer(
          builder: (_) => FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  List<Contact> lista = futuro.data;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var contato = lista[i];
                      
                      
                      return ListTile(
                        leading: circleAvatar(contato.urlAvatar),
                        title: Text(contato.nome),
                        subtitle: Text(contato.telefone),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              editButton((){
                                _back.goToForm(context,contato);
                              }),
                              removeButton(context, (){
                                _back.remove(contato.id);
                                Navigator.of(context).pop();
                              }),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
        ));
  }
}

CircleAvatar circleAvatar(String url){
  
    return (Uri.tryParse(url).isAbsolute) ? CircleAvatar(backgroundImage: NetworkImage(url),)
    : CircleAvatar(child: Icon(Icons.person),);
    }


Widget editButton(Function onPressed){
  return IconButton(onPressed: onPressed, icon: Icon(Icons.edit),color: Colors.orange,);
}

Widget removeButton(BuildContext context,Function onPressed){
  
  return IconButton(
    onPressed: (){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text('Excluir'),
        content: Text('Confirmar exclusão ?'),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('Não')),
          TextButton(onPressed: onPressed,

           child: Text('Sim'))
        ],
      ));
    }, 
    icon: Icon(Icons.delete,color: Colors.red,));
}
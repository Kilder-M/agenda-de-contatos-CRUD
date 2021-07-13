import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:lista_contato_db/app/domain/entities/contact.dart';
import 'package:lista_contato_db/app/domain/services/contact_services.dart';
import 'package:lista_contato_db/app/views/my_app.dart';
import 'package:mobx/mobx.dart';


part 'contact_list_back.g.dart';

class ContactListBack = _ContactListBack with _$ContactListBack;

abstract class _ContactListBack with Store{
  var _services = GetIt.I.get<ContactServices>();
  @observable
  Future<List<Contact>> list;

  @action
  refreshList([dynamic vaalue]){
    list = _services.find();
  }

  _ContactListBack(){
    refreshList();
  }

  goToForm(BuildContext context,[Contact contact]){
    Navigator.of(context).pushNamed(MyApp.CONTACT_FORM,arguments: contact).then(refreshList);
  }

  remove(int id){
    _services.remove(id);
    refreshList();
  }

}
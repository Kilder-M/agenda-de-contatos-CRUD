import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:lista_contato_db/app/domain/entities/contact.dart';
import 'package:lista_contato_db/app/domain/services/contact_services.dart';
import 'package:mobx/mobx.dart';


part 'contact_form_back.g.dart';

class ContactFormBack = _ContactFormBack with _$ContactFormBack;

abstract class _ContactFormBack with Store{
  Contact contato;
  var _service = GetIt.I<ContactServices>();

  bool _nameIsValid;
  bool _phoneIsValid;
  bool _emailIsValid;

  
  bool get isValid => _nameIsValid && _phoneIsValid && _emailIsValid;


  _ContactFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    contato = (parameter == null) ? Contact() : parameter;

  }

  save()async{
    await _service.save(contato);
  }

  String validateName(String name){
    try{
      _service.validateNome(name);
      _nameIsValid = true;
      return null;

    }catch(e){
      return e.toString();
    }
  }

  String validatePhone(String phone){
    try{
      _service.validatePhone(phone);
      _phoneIsValid =true;
      return null;

    }catch(e){
      return e.toString();
    }
  }

  String validateEmail(String email){
    try{
      _service.validateEmail(email);
      _emailIsValid = true;
      return null;

    }catch(e){
      return e.toString();
    }
  }

}
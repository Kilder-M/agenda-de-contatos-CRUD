import 'package:get_it/get_it.dart';
import 'package:lista_contato_db/app/domain/entities/contact.dart';
import 'package:lista_contato_db/app/domain/exceptions/domain_layer_exception.dart';
import 'package:lista_contato_db/app/domain/interfaces/contact_dao.dart';

class ContactServices{

  var _dao = GetIt.I<ContactDAO>();

  save(Contact contact){
    validateNome(contact.nome);
    validateEmail(contact.email);
    validatePhone(contact.telefone);
    _dao.save(contact);

  }

  remove(int id){
    _dao.remove(id);
  }

  Future<List<Contact>>find()async{
    return _dao.find();
  }
  validateNome(String name){
   var max = 50;
   var min =3;

   if(name == null){
     throw new DomainLayerException("O nome é obrigatório.");

   }else if(name.length > max){
     throw new DomainLayerException("O nome deve possuir no máximo $max caracters.");

   }else if(name.length < min){
     throw new DomainLayerException("O nome deve possuir no mínimo $min caracters.");
   }
    

 }

 validateEmail(String email){
   if(email ==null){
     throw new DomainLayerException("O email é obrigatório.");
   }else if(!email.contains('@')){
     throw new DomainLayerException('O email deve possuir @');
   }
 }

validatePhone(String phone){
  var format = RegExp(r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$'); // (99) 9 9999-9999
  if(phone == null){
    throw new DomainLayerException('O telefone é obrigatório.');
  }else if(!format.hasMatch(phone)){
    throw new DomainLayerException('Formato inválido. O formato deve ser (99) 9 9999-9999.');
  }
}

}

 

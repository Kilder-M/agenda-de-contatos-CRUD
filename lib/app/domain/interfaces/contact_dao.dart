import 'package:lista_contato_db/app/domain/entities/contact.dart';

abstract class ContactDAO {
  save(Contact contact);

  remove(int i);

  Future<List<Contact>> find();
}
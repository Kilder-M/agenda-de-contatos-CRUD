import 'package:get_it/get_it.dart';
import 'package:lista_contato_db/app/domain/interfaces/contact_dao.dart';
import 'package:lista_contato_db/app/domain/services/contact_services.dart';
import 'database/sqlite/dao/contact_dao_impl.dart';

setupInjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ContactDAO>(ContactDAOImpl());
  getIt.registerSingleton<ContactServices>(ContactServices());
}
import 'package:get_it/get_it.dart';
import 'package:hive_app/services/hive_service.dart';
import 'package:hive_app/services/local_storage.dart';
import 'package:hive_app/services/service_manager.dart';

class GetItService {

static final locator = GetIt.instance;

void setup(){
  locator.registerSingleton<LocalStorage>(HiveService());
  locator.registerSingleton<ServiceManager>(ServiceManager(locator<LocalStorage>()));
}

}



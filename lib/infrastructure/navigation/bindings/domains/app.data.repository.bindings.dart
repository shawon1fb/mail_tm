import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../domain/repository/app_data/app.data.repository.dart';
import '../../../../domain/repository/usecases/app.data.repository.interface.dart';
import '../../../dal/services/app_data/app.data.local.storage.services.dart';
import '../../../dal/services/storage.dart';
import '../../../dal/usecase/app.data.services.interface.dart';

class AppDataRepositoryBinding {
  late IAppDataRepository _repository;

  IAppDataRepository get repository => _repository;

  AppDataRepositoryBinding() {
    final GetStorage getStorage = Get.find();
    final Storage store = Storage(storage: getStorage);
    final IAppDataService services = AppDataLocalStoreService(storage: store);
    _repository = AppDataRepository(service: services);
  }
}

import 'package:cubit_baslangic/feature/home/domain/repository/home_repository.dart';
import 'package:cubit_baslangic/product/base/service/service_manager.dart';
import 'package:get_it/get_it.dart';
import 'dart:async'; // Import for FutureOr

final class DependencyManager {
  DependencyManager._();

  static final GetIt getIt = GetIt.instance;

  static Future<void> initialize() async {
    getIt.registerLazySingleton<DioServiceManager>(() => DioServiceManager());
    getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepository(getIt<DioServiceManager>()),
    );
  }

  static T get<T extends Object>() {
    return getIt<T>();
  }
}

import 'package:cubit_baslangic/feature/home/domain/repository/home_repository.dart';
import 'package:cubit_baslangic/product/base/service/service_manager.dart';
import 'package:cubit_baslangic/product/core/utility/dependency/dependency_manager.dart';

// Add imports for your registered types here

/// Provides static access to registered dependencies via GetIt.
final class Dependencies {
  Dependencies._(); // Private constructor

  static final DioServiceManager dioServiceManager =
      DependencyManager.get<DioServiceManager>();
  static final HomeRepository homeRepository =
      DependencyManager.get<HomeRepository>();
}

import 'package:fruits_ecommerce/core/repos/products_repo.dart';
import 'package:fruits_ecommerce/core/repos/products_repo_impl.dart';
import 'package:fruits_ecommerce/core/services/database_service.dart';
import 'package:fruits_ecommerce/core/services/fire_store_service.dart';
import 'package:fruits_ecommerce/core/services/firebase_auth_service.dart';
import 'package:fruits_ecommerce/features/authentication/data/repo/auth_repo_implemtation.dart';
import 'package:fruits_ecommerce/features/authentication/domain/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );

  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(databaseService: getIt<DatabaseService>()));
}
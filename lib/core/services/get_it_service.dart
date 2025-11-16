import 'package:fruits_ecommerce/core/repos/order_repo/order_repo.dart';
import 'package:fruits_ecommerce/core/repos/order_repo/order_repo_impl.dart';
import 'package:fruits_ecommerce/core/repos/products_repo/products_repo.dart';
import 'package:fruits_ecommerce/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruits_ecommerce/core/services/database_service.dart';
import 'package:fruits_ecommerce/core/services/fire_store_service.dart';
import 'package:fruits_ecommerce/core/services/firebase_auth_service.dart';
import 'package:fruits_ecommerce/features/authentication/data/repo/auth_repo_implemtation.dart';
import 'package:fruits_ecommerce/features/authentication/domain/repo/auth_repo.dart';
import 'package:fruits_ecommerce/features/home/presentation/cubit/cart/cart_cubit.dart';
import 'package:fruits_ecommerce/features/my%20orders/data/repo/my_orders_repo_impl.dart';
import 'package:fruits_ecommerce/features/my%20orders/domain/repo/my_orders_repo.dart';
import 'package:fruits_ecommerce/features/personal%20profile/data/repo/update_info_repo_impl.dart';
import 'package:fruits_ecommerce/features/personal%20profile/domain/repo/update_info_repo.dart';
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

  getIt.registerSingleton<UpdateInfoRepo>(
    UpdateInfoRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );

  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(databaseService: getIt<DatabaseService>()));
  getIt.registerSingleton<OrdersRepo>(OrdersRepoImpl(databaseService: getIt<DatabaseService>(),));
  getIt.registerSingleton<MyOrdersRepo>(MyOrdersRepoImpl(databaseService: getIt<DatabaseService>(),));

  getIt.registerLazySingleton<CartCubit>(()=> CartCubit());
}
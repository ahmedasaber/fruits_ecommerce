import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_ecommerce/constants.dart';
import 'package:fruits_ecommerce/core/helper_function/on_generate_route.dart';
import 'package:fruits_ecommerce/core/localization%20cubit/language_cubit.dart';
import 'package:fruits_ecommerce/core/repos/products_repo/products_repo.dart';
import 'package:fruits_ecommerce/core/services/bloc_observer_service.dart';
import 'package:fruits_ecommerce/core/services/get_it_service.dart';
import 'package:fruits_ecommerce/core/services/shared_preferences_singleton.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/features/favorites/domain/repo/favorites_repo.dart';
import 'package:fruits_ecommerce/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:fruits_ecommerce/firebase_options.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppPrefs.init();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Bloc.observer = BlocObserverService();

  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory(),);
  await Hive.initFlutter();
  await Hive.openBox<String>(kFavoritesKey);
  setupGetIt();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LanguageCubit()),
        BlocProvider(create: (context) => FavoritesCubit(getIt<ProductsRepo>(), getIt<FavoritesRepo>())..getFavProducts()),
      ], 
      child: const FruitHub(),
    ),
  );
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenerateRoute,
          initialRoute: SplashView.routeName,

          locale: locale,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,

          theme: ThemeData(
            fontFamily: 'Cairo',
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryColor,
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0,
            ),
          ),
        );
      },
    );
  }
}

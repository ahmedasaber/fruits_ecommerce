import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruits_ecommerce/core/helper_function/on_generate_route.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark
          )
        )
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}


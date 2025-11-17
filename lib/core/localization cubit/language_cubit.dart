import 'dart:ui';
import 'package:bloc/bloc.dart';


class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('ar'));

  void changeToEnglish() => emit(const Locale('en'));
  void changeToArabic() => emit(const Locale('ar'));
}

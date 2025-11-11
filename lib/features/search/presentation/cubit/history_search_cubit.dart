import 'package:bloc/bloc.dart';
import 'package:fruits_ecommerce/constants.dart';
import 'package:fruits_ecommerce/core/services/shared_preferences_singleton.dart';
import 'package:meta/meta.dart';

part 'history_search_state.dart';

class HistorySearchCubit extends Cubit<HistorySearchState> {
  HistorySearchCubit() : super(HistorySearchInitial());
  List<String> history = [];

  Future<void> loadHistory() async {
    history = await AppPrefs.getStrings(kHistoryKey);
    if (history.isNotEmpty) {
      emit(HistorySearchLoaded(history: history));
    } else {
      emit(HistorySearchEmpty(history: []));
    }
  }

  Future<void> addHistory(String item) async {
    history.insert(0, item);
    await AppPrefs.setStrings(kHistoryKey, history);
    emit(HistorySearchLoaded(history: history));
  }

  Future<void> removeHistoryItem(int index) async {
    history.removeAt(index);
    await AppPrefs.setStrings(kHistoryKey, history);
    if(history.isEmpty) {
      emit(HistorySearchEmpty(history: history));
    }else{
      emit(HistorySearchLoaded(history: history));
    }
  }

  Future<void> deleteHistory() async {
    history.clear();
    await AppPrefs.setStrings(kHistoryKey, []);
    emit(HistorySearchEmpty(history: history));
  }
}

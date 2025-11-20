import 'package:fruits_ecommerce/features/favorites/data/data_source/data_source.dart';
import 'package:hive_flutter/hive_flutter.dart';


class HiveDataSourceRemoteImpl implements DatabaseRemoteSource{
  static const boxName = 'favoriteBox';
  final Box<String> box;

  HiveDataSourceRemoteImpl({required this.box});

  @override
    Future<List<String>> getFavData() async{
    return box.values.toList();
  }

  @override
  Future<void> toggleFavData({required String productId}) async{
    List<String> favs = await getFavData();
    bool isFav = favs.contains(productId);
    if(isFav){
      favs.remove(productId);
      box.clear();
      box.addAll(favs);
    }else{
      box.add(productId);
    }
  }

}
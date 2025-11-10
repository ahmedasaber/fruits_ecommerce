import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_ecommerce/core/services/database_service.dart';

class FireStoreService implements DatabaseService{
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  @override
  Future<void> addData({required String path, required Map<String, dynamic> data, String? docId}) async{
    if (docId != null) {
      await firebaseFireStore.collection(path).doc(docId).set(data);
    }else{
      await firebaseFireStore.collection(path).add(data);
    }
  }

  // get date of a doc or a collection
  @override
  Future<dynamic> getData({required String path, String? docId, Map<String,dynamic>? query, String? searchQuery}) async{
    if (docId!=null) {
      DocumentSnapshot user = await firebaseFireStore.collection(path).doc(docId).get();
      return user.data() as Map<String,dynamic>;
    }else{
      Query<Map<String, dynamic>> data = firebaseFireStore.collection(path);
      if(query != null){
        if(query['orderBy'] != null){
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          if(searchQuery != null){
            data = data.orderBy(orderByField).where(orderByField, isEqualTo: searchQuery);
          }else{
            data = data.orderBy(orderByField, descending: descending);
          }
        }

        if(query['limit'] != null){
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists({required String path, required String docId}) async{
    var data = await firebaseFireStore.collection(path).doc(docId).get();
    return data.exists;
  }

}
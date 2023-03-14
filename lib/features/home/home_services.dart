import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeService  extends GetxService{
  final CollectionReference _productCollectionRef =
  FirebaseFirestore.instance.collection('products');



  Future<List<QueryDocumentSnapshot>> getFruty() async {
    var value = await _productCollectionRef.get();

    return value.docs;
  }


}
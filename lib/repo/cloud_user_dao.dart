
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudUserDao{

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getUser(){

    var ref = _fireStore.collection("Person").snapshots();
    print("object");
    return ref;
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;


  Future<User?>signIn(String mail, String password) async {

    var user = await _auth.signInWithEmailAndPassword(email: mail, password: password);
    return user.user;
  }

  signOut() async{

    return await _auth.signOut();
  }

  Future<User?>createPerson(int identificationNumber,String mail, int phone, String password) async {

    var user = await _auth.createUserWithEmailAndPassword(email: mail, password: password);

    await _fireStore.collection("Person").doc(user.user?.uid).set({
      "id":identificationNumber,
      "email:": mail,
      "phone":phone,
      "password":password
    });
    return user.user;
  }
}

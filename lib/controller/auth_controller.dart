import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> createNewUser(String email, String fullName,String password, 
  String confirmPassword) async {

   String res = 'some error occured';

   try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email, password: password);

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'fullName': fullName,
        'password': password,
        'buyerId': userCredential.user!.uid,
      });

     res = 'success';
   } catch (e) {
     res = e.toString();
   }
   return res;
  }

  // function to login user

  Future<String> loginUser(String email, String password) async {
    String res = 'some error occured';

    try {
      await _auth.signInWithEmailAndPassword(
        email: email, password: password);

        res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }



}
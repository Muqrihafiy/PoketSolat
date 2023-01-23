import 'package:daily5/models/myuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;


  MyUser? _userFromFirebaseUser(User? user){
    return user != null? MyUser(uid: user.uid) : null;

  }

  Stream<MyUser?> get user {
    return _auth.authStateChanges()
    .map(_userFromFirebaseUser);

  }

  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch(e){
      print(e.toString());
      return null;
    }

  }

  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }

  }

}
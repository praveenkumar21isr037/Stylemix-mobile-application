import 'package:firebase_auth/firebase_auth.dart';


class FirebaseAuthservice{

 FirebaseAuth _auth=FirebaseAuth.instance;

  Future<User?>signinwithEmailandPassword(String email,String password)async{

    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }
    catch(e){
      print("something error occured");
    }
    return null;
  }

  Future<User?>signUpwithEmailandPassword(String email,String password)async{

  try{
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }
  catch(e){
    print("something error occured");
  }
  return null;
}

}
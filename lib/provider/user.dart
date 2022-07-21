
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dokanj/model/usermodel.dart';
import 'package:google_sign_in/google_sign_in.dart';




class AuthBase{

  UserModel _userFromFirebase( firebaseUser  ){
    return UserModel();
  }

  Future<void> registerWithEmailAndPassword(String email,String password) async{
    try{
      final authResult = await   FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(authResult.user);
    } catch (e) {
      print(e.toString());
      return false;
    }
  }


  Future<Object> loginWithEmailAndPassword(String email,String password)async{
    try{
      final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(authResult.user);
    }catch (e) {
      print(e.toString());
      return false;
    }
  }


  Future<void> logout()async{
    try{
      await FirebaseAuth.instance.signOut();
    }catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<UserCredential> signWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser =
      await GoogleSignIn(scopes: <String>["email"]).signIn();

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );


      return await FirebaseAuth.instance.signInWithCredential(credential);
    }catch (e) {
      print(e.toString());
    }
  }

  }





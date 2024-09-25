import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  Stream<User?> observeAuthState(){
    return _firebaseAuth.authStateChanges();
  }

  Future<UserCredential> signInWithCredential(OAuthCredential credential) async {
    return  _firebaseAuth.signInWithCredential(credential);
  }


  Future logout() async{
    await GoogleSignIn().signOut();
    return _firebaseAuth.signOut();
  }
}
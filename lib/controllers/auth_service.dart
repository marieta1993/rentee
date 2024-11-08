import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//send otp code
  static String verifyId = '';
  static Future sentOtp({
    required int phone,
    required Function errorStep,
    required Function nextStep,
  }) async {
    await _firebaseAuth
        .verifyPhoneNumber(
      timeout: Duration(seconds: 60),
      phoneNumber: "+$phone",
      verificationCompleted: (phoneAuthCredential) async {
        return;
      },
      verificationFailed: (error) async {
        return;
      },
      codeSent: (verificationId, forceResendingToken) async {
        verifyId = verificationId;
        nextStep();
      },
      codeAutoRetrievalTimeout: (verificationId) async {
        return;
      },
    )
        .onError((error, stackTrace) {
      errorStep();
    });
  }

  // verify otp code and login

  static Future loginWithOtp({required String otp}) async {
    final cred =
        PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);
    try {
      final user = await _firebaseAuth.signInWithCredential(cred);
      if (user.user != null) {
        return "Success";
      } else {
        return "Error in Otp login";
      }
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  // to logout user
  static Future logout() async {
    await _firebaseAuth.signOut();
  }

//check whether the user is logged in or not
  static Future<bool> isLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    return user != null;
  }
}

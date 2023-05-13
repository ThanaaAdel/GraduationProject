import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduationproject/firebase_services/storage.dart';
import 'package:graduationproject/models/users.dart';
import 'package:graduationproject/shared/snakbar.dart';



class AuthMethods {
  register({
    required userEmail,
    required userPassword,
    required context,
    required userTitle,
    required userName,
    required imgName,
    required imgPath,
    required doctor,


  }) async {
    String message = "ERROR => Not starting the code";

    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      message = "ERROR => Registered only";

// ______________________________________________________________________

      String urlll = await getImgURL(imgName: imgName, imgPath: imgPath, folderName: 'profileIMG');

// _______________________________________________________________________
// firebase firestore (Database)
      CollectionReference users =
      FirebaseFirestore.instance.collection('users');

      UserDate userr = UserDate(
        email: userEmail,
        password: userPassword,
        title: userTitle,
        username: userName,
        profileImg: urlll,
        uid: credential.user!.uid,
        followers: [],
        following: [],
        doctor: doctor

      );

      users
          .doc(credential.user!.uid)
          .set(userr.convert2Map())
          .then((value) => showSnackBar(context,"User added"))
          .catchError((error) =>showSnackBar(context, ("Failed to add user: $error")));

      message = " Registered & User Added 2 DB ♥";
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR :  ${e.code} ");
    } catch (e) {
     showSnackBar(context, "$e");
    }

    showSnackBar(context, message);
  }
  signIn({required userEmail, required userPassword, required context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userEmail, password: userPassword);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR :  ${e.code} ");
    } catch (e) {
      showSnackBar(context, "$e");    }
  }

  // functoin to get user details from Firestore (Database)
  Future<UserDate> getUserDetails() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return UserDate.convertSnap2Model(snap);
  }
  createGroup(
      {
        required emailll,
        required passworddd,
        required context,
        required groupName,
        required doctorName}) async {
    String message = "ERROR => Not starting the code";

    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailll,
        password: passworddd,
      );

      message = "ERROR => Registered only";

// firebase firestore (Database)
      CollectionReference informationGroup =
      FirebaseFirestore.instance.collection('informationGroup');
      informationGroup
          .doc(credential.user!.uid)
          .set({
        'doctorName': doctorName,
        'groupName': groupName,
        "email": emailll,
        "password": passworddd
      })
          .then((value) => print("Group Created"))
          .catchError((error) => print("Failed to create group: $error"));


    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR :  ${e.code} ");
    } catch (e) {
      print(e);
    }

    showSnackBar(context, message);
  }
}
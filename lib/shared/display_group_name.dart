// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DisplayGroupName extends StatelessWidget {
   DisplayGroupName({
    Key? key,
  }) : super(key: key);

  final credential = FirebaseAuth.instance.currentUser;

  CollectionReference users = FirebaseFirestore.instance.collection('informationGroup');

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
    FirebaseFirestore.instance.collection('informationGroup');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(credential!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          return  Text(
            "${data['groupName']}",
            style: TextStyle(
              fontSize: 17,
            ),
          );

        }

        return Text("loading");
      },
    );
  }
}
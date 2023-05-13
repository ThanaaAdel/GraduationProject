import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/provider/user_provider.dart';
import 'package:graduationproject/responsive/mobile.dart';
import 'package:graduationproject/responsive/responsive.dart';
import 'package:graduationproject/responsive/web.dart';
import 'package:graduationproject/screens/login_register_profile_pages/splash_screen.dart';
import 'package:graduationproject/shared/chat_constants.dart';
import 'package:graduationproject/shared/snakbar.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCsoNWQGp0gK0w-oJ_HclrpHzIxw4laBh4",
            authDomain: "insta-c15b7.firebaseapp.com",
            projectId: "insta-c15b7",
            storageBucket: "insta-c15b7.appspot.com",
            messagingSenderId: "724883202315",
            appId: "1:724883202315:web:de71817fa98286a15a420e"
        ));
  } else {
    await Firebase.initializeApp();
  }
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return UserProvider();
        },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
            } else if (snapshot.hasError) {
              return showSnackBar(context, "Something went wrong");
            } else if (snapshot.hasData) {
              return const Resposive(
                myMobileScreen: MobileScerren(),
                myWebScreen: WebScerren(),
              );
            } else {
              return const SplashScreen();
            }
          },
        ),

      ),
    );
  }
}

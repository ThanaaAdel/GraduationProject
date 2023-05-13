import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/Responsive/Responsive.dart';
import 'package:graduationproject/responsive/mobile.dart';
import 'package:graduationproject/responsive/web.dart';
import 'package:graduationproject/screens/login_register_profile_pages/Forget_Password.dart';
import 'package:graduationproject/screens/login_register_profile_pages/register_information_user.dart';
import 'package:graduationproject/shared/snakbar.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisable = false;
  bool doctor = false;
  bool student = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  signIn() async {
    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const Resposive(
                myMobileScreen: MobileScerren(), myWebScreen: WebScerren())),
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR :  ${e.code} ");
    }

    setState(() {
      isLoading = false;
    });
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const Resposive(
              myMobileScreen: MobileScerren(), myWebScreen: WebScerren())),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Stack(
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Lottie.asset('assets/lottie1.json')),
                      const Text(
                        "Fresh Academy",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: "myfont"),
                      ),
                      Center(
                        child: Padding(
                          padding: widthScreen > 600
                              ? EdgeInsets.symmetric(
                                  horizontal: widthScreen * .3)
                              : const EdgeInsets.all(33.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFormField(
                                onTap: () {},
                                validator: (String? value) {
                                  if (value!.isEmpty == true) {
                                    return 'email must not be empty';
                                  }
                                  if (value.contains('.') == false ||
                                      value.contains('@') == false) {
                                    return "email must include '.' and '@' sign";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                // onFieldSubmitted: (value){
                                //   print(value);
                                // } ,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Your Email',
                                    prefixIcon: Icon(Icons.email)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                validator: (value) {
                                  return value!.length < 6
                                      ? "Enter at least 6 character"
                                      : null;
                                },
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                // onFieldSubmitted: (value){
                                //   print(value);
                                // } ,
                                decoration: const InputDecoration(
                                  labelText: 'Your Password',
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: Icon(Icons.remove_red_eye),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Do you Forget Password ?",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white)),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const ForgetPassword()),
                                        );
                                      },
                                      child: const Text('Forget Password',
                                          style: TextStyle(
                                              fontSize: 15,
                                              decoration:
                                              TextDecoration.underline))),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const Text("Doctor"),
                                      Checkbox(
                                          value: doctor,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              doctor = value!;
                                            });
                                          }),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text("Student"),
                                      Checkbox(
                                          value: student,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              student = value!;
                                            });
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await signIn();
                                  if (!mounted) return;
                                  showSnackBar(
                                      context, "successfully sign-in ☺");
                                },
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(12)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                ),
                                child: isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : const Text(
                                        "Sign in",
                                        style: TextStyle(fontSize: 19),
                                      ),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Do not have an account?",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white)),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Register()),
                                        );
                                      },
                                      child: const Text('sign up',
                                          style: TextStyle(
                                              fontSize: 18,
                                              decoration:
                                                  TextDecoration.underline))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ));
  }
}

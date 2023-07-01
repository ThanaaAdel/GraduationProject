import 'package:flutter/material.dart';
import 'package:graduationproject/firebase_services/auth.dart';
import 'package:graduationproject/responsive/mobile.dart';
import 'package:graduationproject/responsive/web.dart';
import 'package:graduationproject/screens/login_page/screens/Login_page.dart';
import 'package:graduationproject/shared/snakbar.dart';
import 'dart:typed_data';
import '../../../Responsive/Responsive.dart';
import '../widgets/show_model_button_sheet.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isVisable = true;
  bool doctor =false;
  bool student = false;
  Uint8List? imgPath;
  String? imgName;
  bool valuefirst = false;
  bool valuesecond = false;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final ageController = TextEditingController();
  final titleController = TextEditingController();
  bool doctorOrStudent = false;



  showmodel() {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const ShowModelButtomSheet();

      },
    );
  }

  clickOnRegister() async {
    if (_formKey.currentState!.validate() &&
        imgName != null &&
        imgPath != null) {
      setState(() {
        isLoading = true;
      });
      await AuthMethods().register(
        userEmail: emailController.text,
        userPassword: passwordController.text,
        context: context,
        userTitle: titleController.text,
        userName: usernameController.text,
        imgName: imgName,
        imgPath: imgPath,
        doctor: doctor,

      );

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
    } else {
      showSnackBar(context, "ERROR");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    ageController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text(
          "Register",
        ),
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        // backgroundColor: appbarGreen,
      ),
      body:
      Center(
        child: Padding(
          padding: widthScreen > 600
              ? EdgeInsets.symmetric(horizontal: widthScreen * .3)
              : const EdgeInsets.all(33.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(125, 78, 91, 110),
                    ),
                    child: Stack(
                      children: [
                        imgPath == null
                            ? const CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 225, 225, 225),
                                radius: 71,
                                backgroundImage:
                                    AssetImage("assets/images/avatar.png"),
                              )
                            : CircleAvatar(
                                radius: 71,
                                backgroundImage: MemoryImage(imgPath!),
                              ),
                        Positioned(
                          left: 99,
                          bottom: -10,
                          child: IconButton(
                            onPressed: () {
                              // uploadImage2Screen();
                              showmodel();
                            },
                            icon: const Icon(Icons.add_a_photo),
                            color: const Color.fromARGB(255, 208, 218, 224),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(

                    onTap: () {},
                    validator: (String? value) {
                      if (value!.isEmpty == true) {
                        return 'name must not be empty';
                      } else {
                        return null;
                      }
                    },
                    controller: usernameController,
                    keyboardType: TextInputType.name,
                    // onFieldSubmitted: (value){
                    //   print(value);
                    // } ,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Your Name',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.person)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onTap: () {},
                    validator: (String? value) {
                      if (value!.isEmpty == true) {
                        return 'Title must not be empty';
                      } else {
                        return null;
                      }
                    },
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Your class',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.title)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Your Email',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.email)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      onChanged: (password) {},
                      // we return "null" when something is valid
                      validator: (value) {
                        return value!.length < 6
                            ? "Enter at least 6 characters"
                            : null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: isVisable ? true : false,
                      decoration:
                      InputDecoration(
                          border: const OutlineInputBorder(),
                         labelText: "password",
                          labelStyle: const TextStyle(color: Colors.white),
                          hintText: "Enter Your Password : ",
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisable = !isVisable;
                                });
                              },

                              icon: isVisable
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)))),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text("Doctor",style: TextStyle(fontSize:20,color: Colors.white)),
                              Checkbox(
                                  value: doctor,
                                  onChanged:  (bool? value) {
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
                              const Text("Student",style: TextStyle(fontSize:20,color: Colors.white)),
                              Checkbox(
                                  value: student,
                                  onChanged:  (bool? value) {
                                    setState(() {
                                      student = value!;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),

                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      clickOnRegister();
                    },
                    style: ButtonStyle(
                      // backgroundColor: MaterialStateProperty.all(BTNgreen),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(12)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Register",
                            style: TextStyle(fontSize: 19),
                          ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Do not have an account?",
                          style: TextStyle(fontSize: 18)),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            );
                          },
                          child: const Text('sign in',
                              style: TextStyle(
                                  fontSize: 18,
                                  decoration: TextDecoration.underline))),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

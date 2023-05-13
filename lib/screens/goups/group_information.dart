import 'package:flutter/material.dart';
import 'package:graduationproject/firebase_services/auth.dart';
class GroupInformation extends StatefulWidget {
  const GroupInformation({Key? key}) : super(key: key);


  @override
  State<GroupInformation> createState() => _GroupInformationState();
}

class _GroupInformationState extends State<GroupInformation> {

  bool isVisable = true;
  bool doctor = false;
  bool student = false;
  bool valuefirst = false;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final doctorNameController = TextEditingController();
  final groupNameController = TextEditingController();
  bool doctorOrStudent = false;
  createGroup() async {
      await AuthMethods().createGroup(
        doctorName: doctorNameController.text,
        groupName: groupNameController.text,
        context: context,
        emailll: emailController.text,
        passworddd: passwordController.text,

      );
      setState(() {
        isLoading = false;
      });
      if (!mounted) return;


    }
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    doctorNameController.dispose();
    groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: MediaQuery.of(context).size.width > 600
          ? null
          : AppBar(
              backgroundColor: Colors.blueGrey,
              title: const Text(
                "Information From Group",
                style: TextStyle(fontFamily: "myfont", fontSize: 25),
              ),
            ),
      body: Center(
        child: Padding(
          padding: widthScreen > 600
              ? EdgeInsets.symmetric(horizontal: widthScreen * .3)
              : const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onTap: () {},
                    validator: (String? value) {
                      if (value!.isEmpty == true) {
                        return 'name must not be empty';
                      } else {
                        return null;
                      }
                    },
                    controller: doctorNameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Please Enter Your Name ...',
                        prefixIcon: Icon(Icons.person)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onTap: () {},
                    validator: (String? value) {
                      if (value!.isEmpty == true) {
                        return 'group name must not be empty';
                      } else {
                        return null;
                      }
                    },
                    controller: groupNameController,
                    keyboardType: TextInputType.name,
                    // onFieldSubmitted: (value){
                    //   print(value);
                    // } ,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Please Enter Group Name ...',
                        prefixIcon: Icon(Icons.group_add)),
                  ),
                  const SizedBox(
                    height: 20,
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
                        prefixIcon: Icon(Icons.email)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      onChanged: (password) {},
                      // we return "null" when something is valid
                      validator: (value) {
                        return value!.length < 6
                            ? "Enter at least 6 characters"
                            : null;
                      },
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: isVisable ? true : false,
                      decoration:InputDecoration(
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
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      createGroup();
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           GroupPage(itemsGrade1: ItemsGrade1(
                      //               subjectName: subjectName,
                      //               doctorName: doctorName),)),
                      // );

                    },
                    style: ButtonStyle(
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
                            "Create Group",
                            style: TextStyle(fontSize: 19),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

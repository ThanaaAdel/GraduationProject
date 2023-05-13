import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/provider/user_provider.dart';
import 'package:graduationproject/screens/all_data_from_home/search.dart';
import 'package:graduationproject/screens/goups/group_information.dart';
import 'package:graduationproject/screens/goups/your_groups/your_groups.dart';
import 'package:graduationproject/screens/subjects_groups/subject_of_grade2.dart';
import 'package:graduationproject/screens/subjects_groups/subject_of_grade3.dart';
import 'package:graduationproject/screens/subjects_groups/subject_of_grade4.dart';
import 'package:graduationproject/screens/subjects_groups/subjects_of_grade1.dart';
import 'package:graduationproject/shared/colors.dart';
import 'package:provider/provider.dart';
class Groups extends StatefulWidget {
  final String uid;

  const Groups({super.key, required this.uid});
  @override
  State<Groups> createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {

  bool isGoin = true;
  Map userDate = {};
  bool isLoading = true;
  late int followers;
  late int following;
  int postCount = 0;
  bool isFollow = true;

  getData() async {
    // Get data from DB

    setState(() {
      isLoading = true;
    });
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(
                widget.uid,
              )
              .get();

      userDate = snapshot.data()!;
      followers = userDate["followers"].length;
      following = userDate["following"].length;
      var snapShotPost = await FirebaseFirestore.instance
          .collection('posts')
          .where(
            "uid",
            isEqualTo: widget.uid,
          )
          .get();
      postCount = snapShotPost.docs.length;
      isFollow = userDate["followers"]
          .contains(FirebaseAuth.instance.currentUser!.uid);
    } catch (e) {
      print(e.toString());
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 216, 216),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const SubjectOfGrade1(),
                ),
              );
            },
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: const ListTile(
                  title: Text("Subjects Of Grade 1"),
                  subtitle: Text(
                    "Press here",
                  ),
                  leading:  CircleAvatar(
                    backgroundImage:
                    AssetImage("assets/images/OIP.jpg"),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const SubjectOfGrade2(),
                ),
              );
            },
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: const ListTile(
                  title: Text("Subjects Of Grade 2"),
                  subtitle: Text(
                    "Press here",
                  ),
                  leading:  CircleAvatar(
                    backgroundImage:
                    AssetImage("assets/images/OIP.jpg"),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const SubjectOfGrade3(),
                ),
              );
            },
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: const ListTile(
                  title: Text("Subjects Of Grade 3"),
                  subtitle: Text(
                    "Press here",
                  ),
                  leading: CircleAvatar(
                    backgroundImage:
                    AssetImage("assets/images/OIP.jpg"),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const SubjectOfGrade4( ),
                ),
              );
            },
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: const ListTile(
                  title: Text("Subjects Of Grade 4"),
                  subtitle: Text(
                    "Press here",
                  ),
                  leading:  CircleAvatar(
                    backgroundImage:
                    AssetImage("assets/images/OIP.jpg"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      appBar: MediaQuery.of(context).size.width > 600
          ? null
          : AppBar(
              backgroundColor: Colors.blueGrey,
              title: const Text(
                "Groups",
                style: TextStyle(fontFamily: "myfont", fontSize: 25),
              ),
              actions: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Search(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.search),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Stack(
                      children: [
                        Positioned(
                          bottom: 19,
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(211, 164, 255, 193),
                                  shape: BoxShape.circle),
                              child: Text(
                                "${cart.selectedSubject.length}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              )),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  const YourGroups(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.groups),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () => {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: appbarbluegray,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    height: 200,
                    child: Column(
                      //  mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Do You Want To Create Group ?",
                            style: TextStyle(fontSize: 22),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const GroupInformation()),
                              );
                            },
                            child: const Text("yes",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("no",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white)),
                          ),
                        ]),
                  ),
                );
              })
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      // backgroundColor:
      // MediaQuery.of(context).size.width > 600 ? secondaryColor2 : Colors.white,
    );
  }
}

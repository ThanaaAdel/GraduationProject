
import 'package:flutter/material.dart';
import 'package:graduationproject/models/Items/items_of_grade4.dart';
import 'package:graduationproject/provider/user_provider.dart';
import 'package:graduationproject/screens/goups/details_subjects/details_subject_of_grade4.dart';
import 'package:graduationproject/screens/goups/group_information.dart';
import 'package:graduationproject/screens/all_data_from_home/search.dart';
import 'package:graduationproject/screens/goups/your_groups/your_groups.dart';
import 'package:provider/provider.dart';

class SubjectOfGrade4 extends StatefulWidget {
  const SubjectOfGrade4({Key? key}) : super(key: key);
  @override
  State<SubjectOfGrade4> createState() => _SubjectOfGrade4State();
}

class _SubjectOfGrade4State extends State<SubjectOfGrade4> {
  bool isGoin = true;
  Map userDate = {};

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 216, 216),
      appBar: MediaQuery
          .of(context)
          .size
          .width > 600
          ? null
          : AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Subjects Of Grade 1",
          style: TextStyle(fontFamily: "myfont", fontSize: 25),
        ),
        actions: [
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
          Row(
            children: [
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
                          builder: (context) => const YourGroups(),
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

body:  Padding(
  padding: const EdgeInsets.all(12.0),
  child:
  GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 33
      ),
      itemCount: subjectsOfGrade4.length,
      itemBuilder: (BuildContext context, int index) {
        return
          GridTile(
          footer: GridTileBar(
            backgroundColor: const Color.fromARGB(182, 0, 0, 0),
            trailing:

            IconButton(
                onPressed: () {
                  Dialog(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      height: 200,
                      child: Column(
                        //  mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text( "Do You Want To Create Group In Grade 2",style: TextStyle(fontSize: 22),),
                            const SizedBox(
                              height: 22,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const GroupInformation()),
                                );
                              },
                              child: const Text("yes",
                                  style: TextStyle(fontSize: 22,color: Colors.white)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("no",
                                  style: TextStyle(fontSize: 22,color: Colors.white)),
                            ),
                          ]),
                    ),
                  );
                },
                icon: const Icon(Icons.more_vert,color:Colors.white,)),

            title: Text(
              subjectsOfGrade4[index].subjectName,
              style: const TextStyle(fontSize: 20, color: Colors.white,fontFamily: "myfont"),
            ),

          ),

          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsSubjectOfGrade4(itemsGrade4: subjectsOfGrade4[index]),
                ),
              );
            },
            child: Image.asset("assets/images/OIP.jpg"),
            //   CircleAvatar(
            //       radius: 10,
            //       backgroundImage: AssetImage(items[index].imgPath)),

          ),);
      }),
),

    );
  }}

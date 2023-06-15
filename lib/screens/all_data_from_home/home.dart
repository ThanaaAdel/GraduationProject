import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/gpa/gpa_screen.dart';
import 'package:graduationproject/screens/chatgroup/home_screen.dart';
import 'package:graduationproject/screens/chat/Notifications.dart';
import 'package:graduationproject/screens/maps/slider.dart';
import 'package:graduationproject/screens/settings/SettingList.dart';
import 'package:graduationproject/screens/add_posts_in_diffrent_pages/add_post_home.dart';
import 'package:graduationproject/screens/login_register_profile_pages/Log_in_information_user.dart';
import 'package:graduationproject/screens/zoom/common/join_screen.dart';
import 'package:graduationproject/shared/DisplayEmail.dart';
import 'package:graduationproject/shared/colors.dart';
import 'package:graduationproject/shared/displayname.dart';
import 'package:graduationproject/screens/posts/information_of_home_post.dart';
import 'package:share_plus/share_plus.dart';

class Home extends StatefulWidget {
  final String uid;
  const Home({Key? key, required this.uid}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map userDate = {};
  bool isLoading = true;
  int postCount = 0;
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
    } catch (e) {
      print(e.toString());
    }

    setState(() {
      isLoading = false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 218, 216, 216),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: Colors.blueGrey,
                child:IconButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => const JoinScreen(),
                  ),);
                }, icon: const Icon(Icons.video_camera_back_rounded ,color: Colors.white,),),
              ),
              const SizedBox(
                height: 15,
              ),
              CircleAvatar(
                radius: 32,
                backgroundColor: Colors.blueGrey,
                child:IconButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddPostHome(),
                    ),);
                }, icon: const Icon(Icons.add ,color: Colors.white,),),
              )
            ]
        ),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.70,
          backgroundColor: appbarbluegray,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/coll1.jpg"),
                          fit: BoxFit.cover),
                    ),
                    accountName: DisplayName(),
                    accountEmail: DisplayEmail(),
                    currentAccountPictureSize: Size.square(99),

                  ),
                  ListTile(
                      title: const Text("Home"),
                      leading: const Icon(Icons.home),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(
                              uid: FirebaseAuth.instance.currentUser!.uid,
                            ),
                          ),
                        );
                      }),
                  ListTile(
                      title: const Text("Regulation"),
                      leading: const Icon(Icons.book),
                      onTap: () {
                        Share.share(
                            'http://mu.menofia.edu.eg/PrtlFiles/Faculties/fci/Portal/Files/%D9%84%D8%A7%D8%A6%D8%AD%D8%A9%20%D8%AD%D8%A7%D8%B3%D8%A8%D8%A7%D8%AA%20%D8%A7%D9%84%D9%85%D9%86%D9%88%D9%81%D9%8A%D8%A9%20%D8%A7%D9%84%D9%86%D8%B3%D8%AE%D8%A9%20%D8%A7%D9%84%D9%85%D8%B9%D8%AF%D9%84%D8%A9-1.pdf',
                            subject: 'Regulation');
                      }),
                  ListTile(
                      title: const Text("Maps"),
                      leading: const Icon(Icons.maps_ugc_sharp),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>CarouselClass(),
                          ),
                        );
                      }),
                  ListTile(
                      title: const Text("Setting"),
                      leading: const Icon(Icons.help_center),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingList(),
                          ),
                        );
                      }),
                  ListTile(
                      title: const Text("Calc gpa"),
                      leading: const Icon(Icons.calculate),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GPACalc(),
                          ),
                        );
                      }),
                  ListTile(
                      title: const Text("Logout"),
                      leading: const Icon(Icons.exit_to_app),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      }),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: const Text("Developed by sanaa adel © 2022",
                    style: TextStyle(fontSize: 16)),
              )
            ],
          ),
        ),
        // backgroundColor:
        // MediaQuery.of(context).size.width > 600 ? secondaryColor2 : Colors.white,
        appBar: MediaQuery.of(context).size.width > 600
            ? null
            : AppBar(
                backgroundColor: appbarbluegray,
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Notifications(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.notifications),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.message),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
                title: const Text(
                  "Fresh Academy",
                  style: TextStyle(fontFamily: "myfont"),
                ),
              ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('posts')
              .orderBy("datePublished", descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return InformationOfHomePost(
                  dataFromDB: data,
                );
              }).toList(),
            );
          },
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:graduationproject/screens/all_data_from_home/search.dart';

import 'page_chat.dart';



class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MediaQuery.of(context).size.width > 600

        ? null
        : AppBar(
      backgroundColor: Colors.blueGrey,
      title: const Text('Chats',
        style: TextStyle(fontFamily: "myfont"),
      ),
      actions: [
        // ignore: prefer_const_constructors
        IconButton(
          icon: const CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.white,
            // ignore: prefer_const_constructors
            child: Icon(
              Icons.camera_alt,
              size: 20.0,

            ),
          ),
          onPressed: () {},
        ),
        // ignore: prefer_const_constructors
        IconButton(
          icon: const CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.white,
            // ignore: prefer_const_constructors
            child: Icon(
              Icons.edit,
              size: 20.0,
              color: Color.fromARGB(255, 76, 141, 95),
            ),
          ),
          onPressed: () {},
        ),
      ],
    ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Search(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.grey[400],
                  ),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        Icons.search,
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      const Text('Search'),
                    ],
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Pagechat(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Row(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage(
                                    'https://cdn4.iconfinder.com/data/icons/avatars-21/512/avatar-circle-human-female-2-1024.png'),
                              ),
                              const Padding(
                                padding: EdgeInsetsDirectional.only(
                                  bottom: 3.0,
                                  end: 3.0,
                                ),
                                child: CircleAvatar(
                                  radius: 7.0,
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Mostafa Elgazar ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                      color: Colors.black
                                    //fontWeight: FontWeight.bold
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        style: TextStyle(

                                          color: Colors.black
                                        //fontWeight: FontWeight.bold
                                      ),
                                        'Hi my name is mostafa nice to chat you',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Container(
                                        width: 7.0,
                                        height: 7.0,
                                        decoration: const BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    const Text('12:28 Am',
                                      style: TextStyle(

                                        color: Colors.black
                                      //fontWeight: FontWeight.bold
                                    ),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),





                    ]),
                  ),
                ),
              ),
            ),
    ],
        )
    );
  }
}

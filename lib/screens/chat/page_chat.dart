import 'package:flutter/material.dart';
import 'package:graduationproject/shared/colors.dart';

class Pagechat extends StatefulWidget {
  const Pagechat({Key? key}) : super(key: key);

  @override
  State<Pagechat> createState() => _PagechatState();
}

class _PagechatState extends State<Pagechat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 216, 216),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.white,
              // ignore: prefer_const_constructors
              child: Icon(
                Icons.phone,
                size: 20.0,
                color: Colors.black,
              ),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.white,
              // ignore: prefer_const_constructors
              child: Icon(
                Icons.video_call,
                size: 20.0,
                color: Colors.black,
              ),
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: appbarbluegray,
        title: const Text(
          'Ahmed Mohamed',
          style: TextStyle(color: Colors.white,fontFamily: "myfont"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: const BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(10.0),
                      topEnd: Radius.circular(10.0),
                      topStart: Radius.circular(10.0),
                    )),
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 10.0,
                ),
                child: const Text(
                  'Hi how are you',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: const BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(10.0),
                      topEnd: Radius.circular(10.0),
                      topStart: Radius.circular(10.0),
                    )),
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 10.0,
                ),
                child: const Text(
                  'Fine',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.black,
                        focusColor: Colors.black,
                        hintStyle: TextStyle(color:Colors.grey[500]),
                        hintText: 'Type your message here...',
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    minWidth: 1.0,
                    child: const Icon(
                      Icons.send,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

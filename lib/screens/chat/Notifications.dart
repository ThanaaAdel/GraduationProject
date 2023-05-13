import 'package:flutter/material.dart';
import 'package:graduationproject/screens/all_data_from_home/search.dart';
class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 216, 216),
      appBar: MediaQuery.of(context).size.width >600 ?null : AppBar(
        backgroundColor:  Colors.blueGrey,
        title: const Text("Notifications"),
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
       ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => notificationItem(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: 1,
              ),
            ],
          ),
        ),
      ),



    );
  }

  Widget notificationItem() =>
      Row(
        children: [
          const CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/106709207?v=4'),
          ),

          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ahmed Fawzi and 2 others',
                  style: TextStyle(
                    fontSize: 16.0,
                 color: Colors.black
                 //   fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children:
                  [
                    const Expanded(
                      child: Text(style: TextStyle(
                          color: Colors.black
                      ),
                        'posted in Algorithms group',
                        maxLines: 1,
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

                  ],
                ),
                const Text(
                  '2 hours ago',
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ],
            ),
          ),
          IconButton(onPressed: (){},
              icon: const Icon(Icons.more_vert,  color: Colors.black) ),
        ],
      );

}
import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 48, 73),
      appBar: AppBar(
        title: Text('Stuff', 
        style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'JJK',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 193, 18, 31),
      ),
      body: ContainerList(),
    );
  }
}

class ContainerList extends StatelessWidget {
  final List<Map<String, dynamic>> containerInfo = [
    {'title': 'Seong-Hu Park', 'info': 'is a South Korean anime director and animator based in Japan. He is best known for directing the anime television series The God of High School and the first season of Jujutsu Kaisen.', 'image': 'assets/seong.jpg'},
    {'title': 'Shouta Goshozono', 'info': 'Shota Goshozono is a talented young anime director whose work is beginning to attract the attention of audiences and critics. He is known for his unique animation style and his ability to tell compelling and insightful stories.', 'image': 'assets/shota.jpg'},
    {'title': 'Hiroshi Seko', 'info': 'Hiroshi Seko is a well-known screenwriter who originally worked for Gainax (Neon Genesis Evangelion), but then went freelance. He is the head writer of the Attack on Titan adaptation, working closely with Hajime Isayama, the author of the manga. Hiroshi also had a hand in the anime Ajin, Banana Fish, Dorohedoro, Jujutsu Kaisen, Mob Psycho 100, and Vinland Saga.', 'image': 'assets/seko.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: containerInfo.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            _showContainerInfo(context, containerInfo[index]);
          },
          child: Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 193, 18, 31),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Image.asset(
                  containerInfo[index]['image'],
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 10),
                Text(
                  containerInfo[index]['title'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'JJK', 
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

void _showContainerInfo(BuildContext context, Map<String, dynamic> info) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Information',
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 50,
            fontFamily: 'JJK',
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              info['image'],
              width: 100,
              height: 100,
            ),
            SizedBox(height: 10),
            Text(
              info['title'],
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 25,
                fontFamily: 'JJK',
              ),
            ),
            Text(info['info']),
          ],
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, 
              textStyle: TextStyle(color: Colors.white),
            ),
            child: Text(
              'Close', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'JJK',
              ),
            ),
          ),
        ],
      );
    },
  );
}
}
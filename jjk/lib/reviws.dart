import 'dart:math';

import 'package:flutter/material.dart';

class Review {
  final String name;
  final String surname;
  final String avatar;
  final int rating;
  final String text;

  Review({
    required this.name,
    required this.surname,
    required this.avatar,
    required this.rating,
    required this.text,
  });
}

List<Review> reviews = [
  Review(
    name: 'jane',
    surname: 'white',
    avatar: 'assets/ava1.jpg',
    rating: 5,
    text: 'Magical Battle is a thrilling blend of magic, action, and suspense.',
  ),
  Review(
    name: 'anar',
    surname: 'Smith',
    avatar: 'assets/ava2.jpg',
    rating: 4,
    text: 'I was hooked from the first episode of Magical Battle. ',
  ),
  Review(
    name: 'tiny',
    surname: 'Saly',
    avatar: 'assets/ava3.jpg',
    rating: 3,
    text: 'Magical Battle is a refreshing take on the magic school genre.',
  ),
  Review(
    name: 'kaly',
    surname: 'Sam',
    avatar: 'assets/ava4.jpg',
    rating: 2,
    text:
        'As a fan of both magic and battle anime, Magical Battle exceeded all of my expectations.',
  ),
  Review(
    name: 'ziya',
    surname: 'Li',
    avatar: 'assets/ava5.jpg',
    rating: 5,
    text: 'Nice experience overall. Would visit again.',
  ),
  Review(
    name: 'arman',
    surname: 'kim',
    avatar: 'assets/ava6.jpg',
    rating: 3,
    text:
        'As a fan of both magic and battle anime, Magical Battle exceeded all of my expectations.',
  ),
  Review(
    name: 'mari',
    surname: 'tim',
    avatar: 'assets/ava7.jpg',
    rating: 2,
    text: 'Nice experience overall. Would visit again.',
  ),
];

class ReviewsPage extends StatefulWidget {
  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  TextEditingController _textEditingController = TextEditingController();
  int _rating = 0;
  late String _randomAvatar;
  late String _randomName;

  @override
  void initState() {
    super.initState();
    _randomAvatar = _generateRandomAvatar();
    _randomName = _generateRandomName();
  }

  String _generateRandomAvatar() {
    int randomNum = Random().nextInt(7) + 1;
    return 'assets/ava$randomNum.jpg';
  }

  String _generateRandomName() {
    List<String> names = ['John', 'Alice', 'Emma', 'David', 'Sophia', 'Liam', 'Olivia'];
    return names[Random().nextInt(names.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 48, 73),
      appBar: AppBar(
        title: Text(
          'Reviews',
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontFamily: 'JJK',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 193, 18, 31),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: reviews.length,
              reverse: true,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(reviews[index].avatar),
                  ),
                  title: Text(
                    '${reviews[index].name} ${reviews[index].surname}',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          for (int i = 0; i < reviews[index].rating; i++)
                            Icon(Icons.star, color: Colors.yellow),
                          for (int i = reviews[index].rating; i < 5; i++)
                            Icon(Icons.star_border, color: Colors.grey),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        reviews[index].text,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter your review',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
              maxLines: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Your Rating: ',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 10),
                for (int i = 1; i <= 5; i++)
                  InkWell(
                    onTap: () {
                      setState(() {
                        _rating = i;
                      });
                    },
                    child: Icon(
                      _rating >= i ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                    ),
                  ),
              ],
            ),
          ),
          Center(
  child: Padding(
    padding: const EdgeInsets.only(bottom: 20.0), 
    child: ElevatedButton(
      onPressed: () {
        setState(() {
          reviews.add(Review(
            name: _randomName,
            surname: '',
            avatar: _randomAvatar,
            rating: _rating,
            text: _textEditingController.text,
          ));
          _textEditingController.clear();
          _rating = 0;
          _randomAvatar = _generateRandomAvatar();
          _randomName = _generateRandomName();
        });
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 193, 18, 31), 
        elevation: 3, 
        shape: RoundedRectangleBorder( 
          borderRadius: BorderRadius.circular(20), 
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Text(
          'Add Review',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    ),
  ),
)
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ReviewsPage(),
  ));
}

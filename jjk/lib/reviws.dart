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
    text: 'As a fan of both magic and battle anime, Magical Battle exceeded all of my expectations.',
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
    text: 'As a fan of both magic and battle anime, Magical Battle exceeded all of my expectations.',
  ),
  Review(
    name: 'mari',
    surname: 'tim',
    avatar: 'assets/ava7.jpg',
    rating: 2,
    text: 'Nice experience overall. Would visit again.',
  ),
];

class ReviewsPage extends StatelessWidget {
  final List<Review> reviews;

  ReviewsPage({required this.reviews});

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
      body: ListView.builder(
        itemCount: reviews.length,
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
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ReviewsPage(reviews: reviews),
  ));
}

import 'package:flutter/material.dart';
import 'package:jjk/review/review.dart';

class ReviewsPage extends StatefulWidget {
  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  TextEditingController _textEditingController = TextEditingController();
  int _rating = 0;
  late Future<List<Review>> futureReviews;

  @override
  void initState() {
    super.initState();
    futureReviews = ReviewProvider().fetchAllReviews();
  }

  void _addReview() {
    // Add review logic here using ReviewProvider
    // Use _textEditingController.text for review text
    // Use _rating for review rating
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
          FutureBuilder<List<Review>>(
            future: futureReviews,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].text),
                        subtitle: Text('Rating: ${snapshot.data![index].rating}'),
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return Center(
                  child: Text('No reviews found.'),
                );
              }
            },
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
                onPressed: _addReview,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 193, 18, 31),
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

import 'package:flutter/material.dart';
import 'news.dart'; // Assuming the News model is defined in a separate file

class NewsDetailPage extends StatelessWidget {
  final News news;

  NewsDetailPage({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          news.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'JJK',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 193, 18, 31),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              news.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              news.detail,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

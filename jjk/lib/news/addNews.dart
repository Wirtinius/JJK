import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddNewsPage extends StatefulWidget {
  @override
  _AddNewsPageState createState() => _AddNewsPageState();
}

class _AddNewsPageState extends State<AddNewsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  Future<void> _addNews() async {
    final String name = _nameController.text;
    final String bio = _bioController.text;
    final String image = _imageController.text;

    final Map<String, dynamic> data = {
      'name': name,
      'bio': bio,
      'image': image,
    };

    final http.Response response = await http.post(
      Uri.parse('http://localhost:3000/news'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      Navigator.pop(context, true); 
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to add news. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 48, 73),
      appBar: AppBar(
        title: Text('Add News',
          style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontFamily: 'JJK',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 193, 18, 31), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
              labelText: 'Name',  
              labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              ),
             ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _bioController,
              decoration: InputDecoration(
              labelText: 'Bio',  
              labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              ),
             ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _imageController,
              decoration: InputDecoration(
              labelText: 'Image Url',  
              labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              ),
             ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _addNews,
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 193, 18, 31), 
              textStyle: TextStyle(color: Colors.white),
            ),
              child: Text('Add News',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 25,
                fontFamily: 'JJK',
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddStuffPage extends StatefulWidget {
  @override
  _AddStuffPageState createState() => _AddStuffPageState();
}

class _AddStuffPageState extends State<AddStuffPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  Future<void> _addStuff() async {
    final String fullName = _fullNameController.text;
    final String bio = _bioController.text;
    final String image = _imageController.text;

    final Map<String, dynamic> data = {
      'full_name': fullName,
      'bio': bio,
      'image': image,
    };

    final http.Response response = await http.post(
      Uri.parse('http://localhost:3000/stuffs'),
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
            content: Text('Failed to add stuff. Please try again.'),
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
        title: Text('Add Stuff',
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
              controller: _fullNameController,
              decoration: InputDecoration(
              labelText: 'Full Name',  
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
              labelText: 'URL',  
              labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              ),
             ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _addStuff,
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 193, 18, 31), 
              textStyle: TextStyle(color: Colors.white),),
              child: Text('Add Stuff',
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

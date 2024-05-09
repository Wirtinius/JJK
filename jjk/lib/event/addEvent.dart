import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  Future<void> _addEvent() async {
    final String name = _nameController.text;
    final String date = _dateController.text;
    final String image = _imageController.text;

    final Map<String, String> data = {
      'name': name,
      'date': date,
      'image': image,
    };

    final http.Response response = await http.post(
      Uri.parse('http://localhost:3000/events'),
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
            content: Text('Failed to add event. Please try again.'),
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
        title: Text('Add Event', 
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
              labelText: 'Event Name',  
              labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              ),
             ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
              labelText: 'Event Date',  
              labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              ),
              ),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _imageController,
              decoration: 
              InputDecoration(
              labelText: 'Image URL',  
              labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              ),
             ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _addEvent,
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 193, 18, 31), 
              textStyle: TextStyle(color: Colors.white),
            ),
              child: Text('Add Event',
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

import 'dart:convert';
import 'package:http/http.dart' as http;

class Event {
  final String id;
  final String name;
  final DateTime date;
  final String image;

  Event({required this.id, required this.name, required this.date, required this.image});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['_id'],
      name: json['name'],
      date: DateTime.parse(json['date']),
      image: json['image'],
    );
  }
}

class EventProvider {
  static const String _baseUrl = 'http://localhost:3000';

  Future<List<Event>> fetchAllEvents() async {
    final response = await http.get(Uri.parse('$_baseUrl/events'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((event) => Event.fromJson(event)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }

  Future<Event> fetchEventById(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/events/$id'));

    if (response.statusCode == 200) {
      return Event.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load event');
    }
  }
}

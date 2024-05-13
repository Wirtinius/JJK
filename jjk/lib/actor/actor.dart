import 'dart:convert';
import 'package:http/http.dart' as http;

class Actors {
  final String id;
  final String name;
  final String bio;
  final String image;

  Actors({required this.id, required this.name, required this.bio, required this.image});

  factory Actors.fromJson(Map<String, dynamic> json) {
    return Actors(
      id: json['_id'],
      name: json['name'],
      bio: json['bio'] ?? "",
      image: json['image'] ?? "",
    );
  }
}

class ActorsProvider {
  static const String _baseUrl = 'http://localhost:3000';

  Future<Actors> createActors(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/actors'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return Actors.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create actors');
    }
  }

  Future<List<Actors>> fetchAllActors() async {
    final response = await http.get(Uri.parse('$_baseUrl/actors'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((actors) => Actors.fromJson(actors)).toList();
    } else {
      throw Exception('Failed to load actors');
    }
  }

  Future<Actors> fetchActorsById(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/actors/$id'));

    if (response.statusCode == 200) {
      return Actors.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('Actors not found');
    } else {
      throw Exception('Failed to load actors');
    }
  }

  Future<Actors> updateActors(String id, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/actors/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return Actors.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('Actors not found');
    } else {
      throw Exception('Failed to update actors');
    }
  }
}

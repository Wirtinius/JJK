import 'dart:convert';
import 'package:http/http.dart' as http;

class Stuff {
  final String id;
  final String fullName;
  final String bio;
  final String image;

  Stuff({required this.id, required this.fullName, required this.bio, required this.image});

  factory Stuff.fromJson(Map<String, dynamic> json) {
    return Stuff(
      id: json['_id'],
      fullName: json['full_name'],
      bio: json['bio'] ?? "",
      image: json['image'] ?? "",
    );
  }
}

class StuffProvider {
  static const String _baseUrl = 'http://localhost:3000';

  Future<Stuff> createStuff(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/stuff'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return Stuff.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create stuff');
    }
  }

  Future<List<Stuff>> fetchAllStuff() async {
    final response = await http.get(Uri.parse('$_baseUrl/stuffs'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((stuff) => Stuff.fromJson(stuff)).toList();
    } else {
      throw Exception('Failed to load stuff');
    }
  }

  Future<Stuff> fetchStuffById(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/stuff/$id'));

    if (response.statusCode == 200) {
      return Stuff.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('Stuff not found');
    } else {
      throw Exception('Failed to load stuff');
    }
  }

  Future<Stuff> updateStuff(String id, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/stuff/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return Stuff.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('Stuff not found');
    } else {
      throw Exception('Failed to update stuff');
    }
  }
}

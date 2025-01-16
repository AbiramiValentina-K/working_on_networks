import 'dart:convert';

import 'package:http/http.dart' as http;
import '../data/album_data.dart';
import '../data/models/album_model.dart';

// When doinig API Calls

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

// Without API Calls
fetchAlbumWithoutAPI() {
  return Album.fromJson(jsonDecode(album_json) as Map<String, dynamic>);
}

List<Album> fetchAlbumListWithoutAPI() {
  List<dynamic> decodedJson = jsonDecode(album_json_list);
  return decodedJson
      .map((json) => Album.fromJson(json as Map<String, dynamic>))
      .toList();
}

Future<List<Album>> fetchAlbumList() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  List<dynamic> decodedJson = jsonDecode(response.body) as List<dynamic>;
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return decodedJson
        .map((json) => Album.fromJson(json as Map<String, dynamic>))
        .toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

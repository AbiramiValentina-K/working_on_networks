import 'package:flutter/material.dart';

import '../../../api/get_api_call.dart';
import '../../../data/models/album_model.dart';

class GetMethodWithoutAPI extends StatefulWidget {
  const GetMethodWithoutAPI({super.key});

  @override
  State<GetMethodWithoutAPI> createState() => _GetMethodWithoutAPIState();
}

class _GetMethodWithoutAPIState extends State<GetMethodWithoutAPI> {
  // late Future<Album> futureAlbum;
  late Album futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbumWithoutAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Title: ${futureAlbum.title}"),
    );
  }
}

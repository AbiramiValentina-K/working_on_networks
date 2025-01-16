import 'package:flutter/material.dart';

import '../../../api/get_api_call.dart';
import '../../../data/models/album_model.dart';

class GetListWithoutAPI extends StatefulWidget {
  const GetListWithoutAPI({super.key});

  @override
  State<GetListWithoutAPI> createState() => _GetListWithoutAPIState();
}

class _GetListWithoutAPIState extends State<GetListWithoutAPI> {
  // late Future<Album> futureAlbum;
  late List<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbumListWithoutAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: futureAlbum.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(futureAlbum[index].title),
            subtitle: Text(futureAlbum[index].id.toString()),
          );
        },
      ),
    );
  }
}

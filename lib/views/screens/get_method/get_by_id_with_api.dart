import 'package:flutter/material.dart';

import '../../../api/get_api_call.dart';
import '../../../data/models/album_model.dart';

class GetMethodWithAPI extends StatefulWidget {
  const GetMethodWithAPI({super.key});

  @override
  State<GetMethodWithAPI> createState() => _GetMethodWithAPIState();
}

class _GetMethodWithAPIState extends State<GetMethodWithAPI> {
  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<Album>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    ));
  }
}

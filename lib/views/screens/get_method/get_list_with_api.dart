import 'package:flutter/material.dart';

import '../../../api/get_api_call.dart';
import '../../../data/models/album_model.dart';

class GetListWithAPI extends StatefulWidget {
  const GetListWithAPI({super.key});

  @override
  State<GetListWithAPI> createState() => _GetListWithAPIState();
}

class _GetListWithAPIState extends State<GetListWithAPI> {
  late Future<List<Album>> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbumList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<List<Album>>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].id.toString()),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    ));
  }
}

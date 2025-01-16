import 'package:flutter/material.dart';

import 'get_method/get_by_id.dart';
import 'get_method/get_by_id_with_api.dart';
import 'get_method/get_list.dart';
import 'get_method/get_list_with_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screensAppBar = [
    "Get By ID",
    "Get By ID with API",
    "Get List",
    "Get List with API"
  ];
  var screenIndex = 0;
  var screens = [
    const GetMethodWithoutAPI(),
    const GetMethodWithAPI(),
    const GetListWithoutAPI(),
    const GetListWithAPI()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(screensAppBar[screenIndex]),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ...screensAppBar.map((e) => ListTile(
                    title: Text(e),
                    onTap: () {
                      setState(() {
                        screenIndex = screensAppBar.indexOf(e);
                      });
                    },
                  )),
            ],
          ),
        ),
        body: screens[screenIndex]);
  }
}

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key, required this.title});

  final String title;

  @override
  State<ListViewPage> createState() => _MyListViewPageState();
}

class _MyListViewPageState extends State<ListViewPage> {
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var dio = Dio();
    try {
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/posts");
      setState(() {
        _data = response.data;
      });
    } catch (error) {
      // print(error);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 157, 157, 157),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          final item = _data[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(item['title'] ?? 'No Title'),
              subtitle: Text(item['body'] ?? 'No Content'),
            ),
          );
        },
      ),
    );
  }
}

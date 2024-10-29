import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 195, 31),
        title: const Text('Home',
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 227, 144),
      body: Container(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/calculator",
                );
              },
              child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                  height: 100,
                  child: const Center(
                      child: Text('Calculator',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)))),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/listview",
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ListViewPage(
                //       title: 'List View',
                //       data: _data,
                //     ),
                //   ),
                // );
              },
              child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 100,
                  child: const Center(
                      child: Text('List View',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)))),
            ),
          ],
        ),
      ),
    );
  }
}

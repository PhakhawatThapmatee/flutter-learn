import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todoProvider.dart';
import 'detail.dart';

class Todolist extends StatelessWidget {
  const Todolist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 2, 34),
        title: const Text(
          'To Do List',
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 210, 255, 248),
      body: Column(
        children: <Widget>[
          addButtonWidget(context),
          Expanded(
            child: listWidget(),
          ),
        ],
      ),
    );
  }

  Widget addButtonWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Detail(),
              ),
            );
          },
          child: const Text("Add"),
        ),
      ),
    );
  }

  Widget listWidget() {
    return Consumer<TodoProvider>(
      builder: (context, todoProvider, child) {
        return ListView.builder(
          itemCount: todoProvider.items.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(todoProvider.items[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    todoProvider.removeItem(index);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

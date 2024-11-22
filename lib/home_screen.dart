import 'package:flutter/material.dart';
import 'repository.dart';
import 'bookmarks_screen.dart';
import 'groceries_screen.dart';

class HomeScreen extends StatelessWidget {
  final Repository repository;

  HomeScreen({required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text('Bookmarks'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookmarksScreen(repository: repository),
                ),
              );
            },
          ),
          ElevatedButton(
            child: Text('Groceries'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GroceriesScreen(repository: repository),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

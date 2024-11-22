import 'package:flutter/material.dart';
import 'repository.dart';

class BookmarksScreen extends StatelessWidget {
  final Repository repository;

  BookmarksScreen({required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bookmarks')),
      body: StreamBuilder<List<String>>(
        stream: repository.bookmarksStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final bookmarks = snapshot.data!;

          return ListView.builder(
            itemCount: bookmarks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(bookmarks[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    repository.removeBookmark(bookmarks[index]);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          repository.addBookmark('Bookmark ${DateTime.now()}');
        },
      ),
    );
  }
}

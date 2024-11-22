import 'package:flutter/material.dart';
import 'repository.dart';

class GroceriesScreen extends StatelessWidget {
  final Repository repository;

  GroceriesScreen({required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Groceries')),
      body: StreamBuilder<List<String>>(
        stream: repository.groceriesStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final groceries = snapshot.data!;

          return ListView.builder(
            itemCount: groceries.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(groceries[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    repository.removeGrocery(groceries[index]);
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
          repository.addGrocery('Grocery ${DateTime.now()}');
        },
      ),
    );
  }
}

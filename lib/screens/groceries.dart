import 'package:first_flutter_app/screens/new_item.dart';
import 'package:flutter/material.dart';

import 'package:first_flutter_app/data/dummy_items.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  void addNewItem(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: () => addNewItem(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) => ListTile(
          leading: Container(
            width: 25,
            height: 25,
            color: groceryItems[index].category.color,
          ),
          title: Text(
            groceryItems[index].name,
            style: const TextStyle(fontSize: 18),
          ),
          trailing: Text(
            groceryItems[index].quantity.toString(),
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}

import 'package:first_flutter_app/models/grocery_item.dart';
import 'package:first_flutter_app/screens/new_item.dart';
import 'package:flutter/material.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> groceries = [];

  void addNewItem(BuildContext context) async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    if (newItem == null) {
      //null if the user wants to go back without entering any data
      return;
    }
    setState(() {
      groceries.add(newItem);
    });
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
        itemCount: groceries.length,
        itemBuilder: (ctx, index) => ListTile(
          leading: Container(
            width: 25,
            height: 25,
            color: groceries[index].category.color,
          ),
          title: Text(
            groceries[index].name,
            style: const TextStyle(fontSize: 18),
          ),
          trailing: Text(
            groceries[index].quantity.toString(),
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}

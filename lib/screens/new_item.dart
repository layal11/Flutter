import 'package:flutter/material.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    const appBarTitle = 'Add a New Item';

    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Text('the from'),
      ),
    );
  }
}

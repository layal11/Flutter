import 'package:first_flutter_app/data/categories.dart';
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      return 'Demo...';
                    },
                    maxLength: 50,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: const Text('Name'),
                      labelStyle: TextStyle(
                        color: (Colors.amber[200]),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            return 'Demo..';
                          },
                          initialValue: '1',
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: const Text('Quantity'),
                            labelStyle: TextStyle(
                              color: (Colors.amber[200]),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButtonFormField(
                          onChanged: (value) {},
                          items: categories.entries
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category.value,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        color: category.value.color,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(category.value.name),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),

                          // items: [
                          //   for (final category in categories.entries)
                          //     DropdownMenuItem(
                          //       child: Row(
                          //         children: [
                          //           Expanded(
                          //             child: Container(
                          //               width: 20,
                          //               height: 20,
                          //               color: category.value.color,
                          //             ),
                          //           ),
                          //           const SizedBox(width: 10),
                          //           Text(category.value.name),
                          //         ],
                          //       ),
                          //     ),
                          // ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

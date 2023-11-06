import 'package:first_flutter_app/data/categories.dart';
import 'package:first_flutter_app/models/category.dart';
import 'package:flutter/material.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final formKey = GlobalKey<FormState>();
  var enteredName = '';
  int enteredQuantity = 1;
  var selectedCategory = categories[Categories.vegetables];

  void saveItem() {
    if (formKey.currentState!.validate()) {
      //save only if the form is validated
      formKey.currentState!.save();
      print(enteredName);
      print(enteredQuantity);
      print(selectedCategory);
    }
  }

  void resetForm() {
    formKey.currentState!.reset();
  }

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
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (newValue) {
                      enteredName = newValue!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name cannot be empty';
                      }
                      if (value.trim().length <= 1) {
                        return 'Name has to be more than one character';
                      }
                      if (value.trim().length > 50) {
                        return 'Name shouldn\'t exceed 50 characters';
                      }
                      return null;
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
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          onSaved: (newValue) {
                            enteredQuantity = int.parse(newValue!);
                          },
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                int.tryParse(value) == null) {
                              return 'Quantity cannot be empty';
                            }
                            if (int.tryParse(value)! <= 0) {
                              return 'Quantity can\'t be \n negative';
                            }
                            return null;
                          },
                          initialValue: enteredQuantity.toString(),
                          keyboardType: TextInputType.number,
                          maxLength: 50,
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
                          value: selectedCategory, //initial value (vegetables)
                          onChanged: (value) {
                            setState(() {
                              //setState to keep sync between the UI and the value that needs to be saved
                              selectedCategory = value;
                            });
                          },
                          // hint: const Text('Select category'), //dropdown label
                          padding: const EdgeInsets.only(bottom: 15),
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
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          resetForm();
                        },
                        child: const Text('Reset'),
                      ),
                      ElevatedButton(
                        onPressed: saveItem,
                        child: const Text('Add Item'),
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

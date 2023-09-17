import 'dart:io';
import 'package:first_flutter_app/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;
  Categories selectedCategory = Categories.food;

  void datePicker() async {
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 1);
    final lastDate = now;

    var pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstdate,
      lastDate: lastDate,
    );
    setState(() {
      selectedDate = pickedDate;
    });
  }

  void _showDialog() {
    //show error message on IOS
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Input!'),
          content: const Text('Please make sure to insert all data correctly.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    } else {
      //show error message on other devices
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input!'),
          content: const Text('Please make sure to insert all data correctly.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }
  }

  void saveExpenseData() {
    final titleIsInvalid = titleController.text.trim().isEmpty;
    final amountEntered = double.tryParse(amountController.text);
    final amountIsInvalid = amountEntered == null || amountEntered <= 0;
    final dateIsInvalid = selectedDate == null;

    if (titleIsInvalid || amountIsInvalid || dateIsInvalid) {
      _showDialog();
      return;
    }
    widget.onAddExpense(
      Expense.named(
          title: titleController.text,
          amount: amountEntered,
          date: selectedDate!,
          category: selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // clean up the controller when the widget is diposed
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(builder: (ctx, constraints) {
      print('maxWidth: $constraints.maxWidth');
      final width = constraints.maxWidth;
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 25, keyboardSpace + 15),
            child: Column(
              children: [
                if (width > 600) //title + amount
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: titleController,
                          maxLength: 50,
                          keyboardType: TextInputType.text,
                          //show optimized keyboard (number, email) - we don't need it here .text is the default
                          decoration: const InputDecoration(
                            label: Text('Title'),
                            labelStyle: TextStyle(
                              color: Colors.redAccent,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: TextField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            label: Text('Amount'),
                            prefixText: '\$ ',
                            labelStyle: TextStyle(
                              color: Colors.redAccent,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    controller: titleController,
                    maxLength: 50,
                    keyboardType: TextInputType.text,
                    //show optimized keyboard (number, email) - we don't need it here .text is the default
                    decoration: const InputDecoration(
                      label: Text('Title'),
                      labelStyle: TextStyle(
                        color: Colors.redAccent,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                if (width >= 600) //category + date
                  Row(
                    children: [
                      DropdownButton(
                        value: selectedCategory,
                        items: Categories.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category.name.toUpperCase(),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            if (value == null) {
                              return;
                            }
                            selectedCategory = value;
                          });
                          print(value);
                        },
                      ),
                      const Spacer(),
                      // Expanded(
                      //   child:
                      Row(
                        children: [
                          Text(
                            selectedDate == null
                                ? 'Select a date'
                                : DateFormat.yMd().format(
                                    selectedDate!), // selectedDate! to tell flutter that this can't be null
                          ),
                          IconButton(
                            onPressed: datePicker,
                            icon: const Icon(Icons.calendar_month),
                          ),
                        ],
                      ),
                      // ),
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            label: Text('Amount'),
                            prefixText: '\$ ',
                            labelStyle: TextStyle(
                              color: Colors.redAccent,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ),

                      //date
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              selectedDate == null
                                  ? 'Select a date'
                                  : DateFormat.yMd().format(
                                      selectedDate!), // selectedDate! to tell flutter that this can't be null
                            ),
                            const SizedBox(width: 30),
                            IconButton(
                              //to remove IconButton padding
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),

                              onPressed: datePicker,
                              icon: const Icon(Icons.calendar_month),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 20),
                if (width >= 600) //buttons
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          saveExpenseData();
                        },
                        child: const Text('Save Expense'),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      DropdownButton(
                        value: selectedCategory,
                        items: Categories.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category.name.toUpperCase(),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            if (value == null) {
                              return;
                            }
                            selectedCategory = value;
                          });
                          print(value);
                        },
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),

                      const Spacer(),
                      // const Padding(padding: EdgeInsets.only(right: 10)),

                      ElevatedButton(
                        onPressed: () {
                          saveExpenseData();
                        },
                        child: const Text('Save Expense'),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}

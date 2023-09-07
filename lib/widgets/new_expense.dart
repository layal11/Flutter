import 'package:first_flutter_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

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

  void saveExpenseData() {
    final titleIsInvalid = titleController.text.trim().isEmpty;
    final amountEntered = double.tryParse(amountController.text);
    final amountIsInvalid = amountEntered == null || amountEntered <= 0;
    final dateIsInvalid = selectedDate == null;

    if (titleIsInvalid || amountIsInvalid || dateIsInvalid) {
      //show error message
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input!'),
          content: const Text('Please make sure to insert all data.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
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
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            keyboardType: TextInputType
                .text, //show optimized keyboard (number, email) - we don't need it here .text is the default
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
    );
  }
}

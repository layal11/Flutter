import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  String enteredTitle = '';
  int enteredAmount = 0;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  // void saveTitleInput(String inputValue) {
  //   enteredTitle = inputValue;
  // }
  void saveInputs(String inputTitle, int inputAmount) {
    enteredTitle = inputTitle;
    enteredAmount = inputAmount;
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
          TextField(
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
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  print(titleController.text);
                  print(amountController.text);
                },
                child: const Text('Save Expense'),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

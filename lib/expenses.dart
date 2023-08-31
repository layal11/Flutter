import 'package:first_flutter_app/expenses_list.dart';
import 'package:first_flutter_app/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense.named(
        title: 'Fast food',
        amount: 10.5,
        date: DateTime.now(),
        category: Categories.food),
    Expense.named(
        title: 'Flutter course',
        amount: 20,
        date: DateTime.now(),
        category: Categories.work),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The Chart...'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}

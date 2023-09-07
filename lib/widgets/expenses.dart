import 'package:first_flutter_app/widgets/expenses_list/expenses_list.dart';
import 'package:first_flutter_app/models/expense.dart';
import 'package:first_flutter_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final String appBarText = 'Flutter - Expense Tracker';
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

  void addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarText),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
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

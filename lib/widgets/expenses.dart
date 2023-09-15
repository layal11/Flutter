import 'package:first_flutter_app/widgets/charts/chart.dart';
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
        amount: 150,
        date: DateTime.now(),
        category: Categories.food),
    Expense.named(
        title: 'Flutter course',
        amount: 80,
        date: DateTime.now(),
        category: Categories.work),
    Expense.named(
        title: 'Europe tourism',
        amount: 1000,
        date: DateTime.now(),
        category: Categories.travel),
    Expense.named(
        title: 'Movies subscription',
        amount: 100,
        date: DateTime.now(),
        category: Categories.leisure),
  ];

  void addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: const Text('Expense deleted'),
        backgroundColor: Colors.blueAccent,
        action: SnackBarAction(
          label: 'Undo',
          textColor: const Color.fromARGB(255, 250, 143, 136),
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
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
    print(MediaQuery.of(context).size.width);
    final screenWidth = MediaQuery.of(context).size.width; //764

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: removeExpense,
      );
    }
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
      body: screenWidth < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}

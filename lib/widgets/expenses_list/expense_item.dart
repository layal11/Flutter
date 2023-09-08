import 'package:first_flutter_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expenseItem});
  final Expense expenseItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Text(expenseItem.title),
            const SizedBox(height: 10),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${expenseItem.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expenseItem.category]),
                    const SizedBox(width: 8),
                    Text(expenseItem.getFormattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

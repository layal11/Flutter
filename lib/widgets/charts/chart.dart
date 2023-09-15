import 'package:first_flutter_app/models/expense.dart';
import 'package:first_flutter_app/widgets/charts/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});
  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Categories.food),
      ExpenseBucket.forCategory(expenses, Categories.leisure),
      ExpenseBucket.forCategory(expenses, Categories.travel),
      ExpenseBucket.forCategory(expenses, Categories.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpenses = 0;
    for (final bucket in buckets) {
      if (bucket.getTotalExpenses > maxTotalExpenses) {
        maxTotalExpenses = bucket.getTotalExpenses;
      }
    }
    return maxTotalExpenses;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Theme.of(context).cardTheme.margin!.horizontal - 14,
        vertical: Theme.of(context).cardTheme.margin!.vertical,
      ),
      width: double.infinity,
      height: 240,
      child: Column(
        children: [
          // //using for ... in
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets)
                  ChartBar(
                    fill: bucket.getTotalExpenses == 0
                        ? 0
                        : bucket.getTotalExpenses / maxTotalExpense,
                  )
              ],
            ),
          ),

          // //using .map()
          // Expanded(
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: buckets
          //         .map(
          //           (bucket) => Expanded(
          //             child: ChartBar(
          //                 fill: bucket.getTotalExpenses == 0
          //                     ? 0
          //                     : bucket.getTotalExpenses / maxTotalExpense),
          //           ),
          //         )
          //         .toList(),
          //   ),
          // ),
          const SizedBox(height: 15),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Icon(
                      categoryIcons[bucket.category],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                CircleAvatar(
                  backgroundColor: data['user_answer'] == data['correct_answer'] ? Colors.green : Colors.red,
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                  ),
                ),
                Expanded(
                  // the widget passed as a child to Expanded can't take more than the width of the widget above it and here it's the Row.
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      Text(data['question'].toString(),style: const TextStyle(fontSize: 15),),
                      const SizedBox(height: 10),
                      Text(data['correct_answer'].toString()),
                      const SizedBox(height: 10),
                      Text(data['user_answer'].toString()),
                      const SizedBox(height: 30),

                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

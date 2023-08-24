import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.sumryData});

  final List<Map<String, Object>> sumryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: sumryData.map((data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    child: CircleAvatar(
                      backgroundColor:
                          data['user_answer'] == data['correct_answer']
                              ? Colors.green
                              : Colors.red,
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    // the widget passed as a child to Expanded can't take more than the width of the widget above it and here it's the Row.
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          data['question'].toString(),
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 5),
                        Text(data['correct_answer'].toString()),
                        const SizedBox(height: 5),
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
      ),
    );
  }
}

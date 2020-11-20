import "package:flutter/material.dart";

import "./answer.dart";
import "./question.dart";

class Quiz extends StatelessWidget {
  
  final Function answer;
  final int qI;
  final List<Map<String, Object>> questions;

  Quiz({@required this.answer, @required this.questions, @required this.qI});

  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                Question(
                  questions[qI]['question'],
                ),
                ...(questions[qI]['answers'] as List<String>).map((q) {
                  return Answer(q, answer);
                }).toList(),
              ],
            );
  }
}
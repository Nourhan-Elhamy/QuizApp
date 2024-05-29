import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_text.dart';
import 'package:quizapp/core/widjets/app_bar.dart';
import 'package:quizapp/feature/correct_answer/views/widget/check_answer_body.dart';

import '../../home/models/question_model.dart';

class CorrectAnswerScreen extends StatelessWidget {
  const CorrectAnswerScreen({super.key, required this.questions});
final List<QuestionModel> questions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: CustomAppbar(
          name: AppTexts.checkanswer,
        ),

      ),
     body: CheckAnswerBody(
       questions:questions

     ),
    );
  }
}
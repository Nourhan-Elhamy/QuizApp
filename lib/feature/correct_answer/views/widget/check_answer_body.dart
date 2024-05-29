import 'package:flutter/cupertino.dart';
import 'package:quizapp/feature/correct_answer/views/widget/check_answer_item.dart';
import 'package:quizapp/feature/home/models/question_model.dart';

class CheckAnswerBody extends StatelessWidget {
  const CheckAnswerBody({super.key, required this.questions});
final List<QuestionModel> questions;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...questions.map((questionModel) =>
            CustomCheckAnswerItem(
               questionModel: questionModel,
            )
        )
      ],
    );
  }
}

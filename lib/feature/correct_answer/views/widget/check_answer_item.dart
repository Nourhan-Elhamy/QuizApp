import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_colors.dart';
import 'package:quizapp/feature/home/models/question_model.dart';
import 'package:quizapp/feature/home/views/widget/custom_home%20divider.dart';

class CustomCheckAnswerItem extends StatelessWidget {
  const CustomCheckAnswerItem({super.key, required this.questionModel,   });
final QuestionModel questionModel;
static int count=0;
  @override
  Widget build(BuildContext context) {
int count=0;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(
          10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),

            Text(questionModel.id),


            Padding(
              padding: EdgeInsets.only(right: 21),
              child: Text(questionModel.title,style: TextStyle(
                fontFamily: "Almarai",
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor
              ),),
            ),
            SizedBox(height: 10,),
            CustomHomeDivider(),
            SizedBox(height: 40,),
            Align(
              alignment: Alignment.center,
              child: Wrap(
                children: [
                  ...questionModel.answer.map((answer) =>
                   SizedBox(
                     width: MediaQuery.of(context).size.width/2 -60,
                     child: Text(answer,style: TextStyle(
                       fontFamily: "Almarai",
                       fontSize: 14,
                       fontWeight: FontWeight.w400,
                       color:
                         questionModel.correctanswer==answer ? Colors.green:
                             questionModel.correctanswer != questionModel.selectanswer &&
                         questionModel.selectanswer==answer ?
                                 Colors.red :
                                 Colors.black
                     ),),
                   )
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Divider()
          ],
        ),
      ),
    );
  }
}

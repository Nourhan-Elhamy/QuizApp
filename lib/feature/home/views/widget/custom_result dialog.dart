import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_colors.dart';
import 'package:quizapp/core/utils/app_text.dart';
import 'package:quizapp/feature/correct_answer/views/correct_answer_screen.dart';
import 'package:quizapp/feature/home/models/question_model.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({required this.score,required this.length, required this.click, required this.questions});
  final int score;
  final int length;
  final void Function ()? click;
  final List<QuestionModel> questions;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: (  ) {
            Navigator.pop(context);
          }, icon: Icon(Icons.close)),
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: AppColors.containerGrey,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 0.5,
                      color: AppColors.primaryColor
                  )
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 91,vertical: 16),
                    child: Text(AppTexts.result,style: TextStyle(fontFamily: "Almarai",color: AppColors.result,fontSize: 20,fontWeight: FontWeight.w700),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${score}/${length*10}",style: TextStyle(color: AppColors.primaryColor),),
                  )
                ],
              ),
            ),
          ),
          Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
                    return CorrectAnswerScreen(
                      questions : questions
                    );
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 16),
                  child: Text("راجع اجاباتك",style: TextStyle(fontFamily: "Almarai",color: AppColors.primaryColor,fontSize: 14,fontWeight: FontWeight.w700),),
                ),
                style: ButtonStyle(

                    backgroundColor: MaterialStateProperty.all(AppColors.containerGrey),
                    shape: MaterialStateProperty.all(

                      RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(8),
                      ),

                    )

                ),
              )
          ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: GestureDetector(
                onTap: click,
              child: Container(
                height: 40,
                width: 234,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(AppTexts.retest,style: TextStyle(fontFamily: "Almarai",
                      fontSize: 14,color: AppColors.white),),
                ),
              ),
              )
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_colors.dart';
import 'package:quizapp/core/utils/app_text.dart';
import 'package:quizapp/core/widjets/app_bar.dart';
import 'package:quizapp/feature/home/models/question_model.dart';
import 'package:quizapp/feature/home/views/widget/custom_home%20divider.dart';
import 'package:quizapp/feature/home/views/widget/custom_result%20dialog.dart';



class FirstScrean extends StatefulWidget {
  const FirstScrean({super.key});

  @override
  State<FirstScrean> createState() => _FirstScreanState();

}




class _FirstScreanState extends State<FirstScrean> {
  String ?options ;
  List<QuestionModel> questions = [

    QuestionModel(title : "ماهي عاصمة المغرب؟",answer: ["الرباط","الدوحة"],correctanswer :"الرباط",selectanswer : null,id: "1)")
    ,

    QuestionModel(title : "ما هي أكبر قارة بالعالم؟",answer : ["اوروبا","اسيا","افريقيا","استراليا"],correctanswer :"اسيا",selectanswer : null,id:"2)")
    ,
    QuestionModel(title: "كم عدد كواكب المجموعة الشمسية؟", answer: ["8","9","7"],correctanswer: "8", selectanswer: null,id: "3)"),



  ];
  changeselectAnswertonull(){
    for(int i =0;i< questions.length;i++){
      questions[i].selectanswer=null;
    }
  }
  int score=0;
  checkScore(){
    for(int i =0;i<questions.length;i++)
    {
      if(questions[i].correctanswer==questions[i].selectanswer){
        score+=10;
      }
    }
  }
  int questionindex =0;
  increaseindex(){
    if(questionindex<questions.length-1){
      if(questions[questionindex].selectanswer!=null){
        questionindex++;
        setState(() {
        });
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content: Text("Please select answer"),
          backgroundColor: AppColors.primaryColor,
        ));
      }
    }
    else{
      checkScore();
      showDialog(context: context, builder: (cont)
      {
        return CustomDialog(
          score: score,
          length: questions.length,
          questions: questions,
          click: (){
            questionindex=0;
            score=0;
            changeselectAnswertonull();
            Navigator.pop(context);
            setState(() {

            });
          },
        );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
       appBar: AppBar(
         flexibleSpace: CustomAppbar(
           name: AppTexts.appName,
         ),
       ),

        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(30),
              child: Text(questions[questionindex].title,
                style: TextStyle(color: AppColors.primaryColor,
                    fontFamily: "Almarai",fontSize: 20,fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,),
            ),
            CustomHomeDivider(),
            ...questions[questionindex].answer.map(
                    (answer){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [


                      Radio(
                          activeColor: AppColors.primaryColor
                          ,value:answer, groupValue: questions[questionindex].selectanswer
                          , onChanged: (x){
                        questions[questionindex].selectanswer=x;
                        setState(() {

                        });
                      }
                      ),
                      Text(answer,style: TextStyle(color: AppColors.primaryColor,
                          fontFamily: "Almarai",fontSize: 20),),

                    ],);
                }
            ),
            CustomHomeDivider(),



            ElevatedButton(onPressed: (){
              increaseindex();
            }
              , child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(questionindex==questions.length-1 ?AppTexts.send:AppTexts.next,
                    style: TextStyle(fontFamily: "Almarai"
                        ,color: AppColors.white)),
              ),
              style: ElevatedButton.styleFrom(
                primary: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            )
            ,Text("${questionindex+1}/${questions.length}",
              style: TextStyle(
                  fontSize: 20
              ),)
          ],
        ),
      ),
    );
  }
}
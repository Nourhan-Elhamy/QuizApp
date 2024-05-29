class QuestionModel {
  String title;
  List<String> answer;
  String ?selectanswer;
  String correctanswer;
  String id;




  QuestionModel(
  {
    required this.title,
    required this.answer,
    required this.correctanswer,
    required this.selectanswer,
    required this.id


}
      );



}
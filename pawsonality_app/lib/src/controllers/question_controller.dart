import 'package:pawsonality_app/src/infrastructure/models/question_model.dart';

class QuestionController {
  Map<String, AnswerType> selectedAnswers = {};

  void setAnswer(String question, AnswerType answerType) {
    selectedAnswers[question] = answerType;
  }

  List<AnswerType> getAnswers() {
    return selectedAnswers.values.toList();
  }

  void removeAnswer(String question) {
    selectedAnswers.remove(question);
  }

  AnswerType? getAnswer(String question) {
    return selectedAnswers[question];
  }
}

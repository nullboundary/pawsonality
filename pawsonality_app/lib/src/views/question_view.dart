import 'package:flutter/material.dart';

import 'package:pawsonality_app/src/controllers/question_controller.dart';
import 'package:pawsonality_app/src/widgets/option_selector.dart';
import 'package:pawsonality_app/src/infrastructure/models/question_model.dart';

class QuestionView extends StatefulWidget {
  final int index;
  final List<Question> questions;
  final PageController pageController;
  final QuestionController controller;
  const QuestionView(
      {required this.index,
      required this.questions,
      required this.pageController,
      required this.controller,
      super.key});

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[widget.index];

    return Container(
      padding: const EdgeInsets.all(32.0),
      color: const Color(0xFFF2F0DB),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Text(
            currentQuestion.questionTitle,
            style: TextStyle(
                color: Color(0xFF45423F),
                fontSize: 28.0,
                height: 1.035,
                fontFamily: 'AvantGarde LT',
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16.0),
          Text(
            currentQuestion.questionText,
            style: TextStyle(color: Color(0xFF45423F), fontFamily: 'AvantGarde LT', fontSize: 16.0),
          ),
          const SizedBox(height: 16.0),
          OptionSelector<String>(
            options: currentQuestion.answers,
            getDescription: (option) => currentQuestion.answerDescriptions[option] ?? 'Unknown',
            selectedOptions: {
              if (widget.controller.getAnswer(currentQuestion.questionText) != null)
                currentQuestion.answers[
                    currentQuestion.answerTypes.indexOf(widget.controller.getAnswer(currentQuestion.questionText)!)]
            },
            onSelected: (option, selected) {
              setState(() {
                final answerIndex = currentQuestion.answers.indexOf(option);
                final answerType = currentQuestion.answerTypes[answerIndex];
                if (selected) {
                  print('Set $answerType');
                  widget.controller.setAnswer(currentQuestion.questionText, answerType);
                } else {
                  widget.controller.selectedAnswers.remove(option);
                }
              });
            },
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFF45423F),
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
                ),
                onPressed: widget.controller.selectedAnswers.isNotEmpty
                    ? () {
                        widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    : null,
                child: const Text('NEXT',
                    style: TextStyle(
                        color: Color(0xFFF2F0DB),
                        fontSize: 16.0,
                        fontFamily: 'AvantGarde LT',
                        fontWeight: FontWeight.w700))),
          ),
        ],
      ),
    );
  }
}

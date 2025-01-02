import 'package:flutter/material.dart';
import 'package:pawsonality_app/src/controllers/question_controller.dart';
import 'package:pawsonality_app/src/infrastructure/models/question_model.dart';
import 'package:pawsonality_app/src/views/question_view.dart';
import 'package:pawsonality_app/src/views/results.dart';

class MbtiQuiz extends StatefulWidget {
  const MbtiQuiz({super.key});

  @override
  State<MbtiQuiz> createState() => _OnboardState();
}

class _OnboardState extends State<MbtiQuiz> {
  final PageController _pageController = PageController();
  final _formKey = GlobalKey<FormState>();
  late List<Widget> pages;
  int _currentPage = 0;
  String _mbtiType = '';

  final QuestionController _eiController = QuestionController();
  final QuestionController _snController = QuestionController();
  final QuestionController _tfController = QuestionController();
  final QuestionController _jpController = QuestionController();

  @override
  void initState() {
    super.initState();

    //TODO: Use loops to set up question pages
    pages = [
      QuestionView(index: 0, questions: eiQuestions, pageController: _pageController, controller: _eiController),
      QuestionView(index: 1, questions: eiQuestions, pageController: _pageController, controller: _eiController),
      QuestionView(index: 2, questions: eiQuestions, pageController: _pageController, controller: _eiController),
      QuestionView(index: 0, questions: snQuestions, pageController: _pageController, controller: _snController),
      QuestionView(index: 1, questions: snQuestions, pageController: _pageController, controller: _snController),
      QuestionView(index: 0, questions: tfQuestions, pageController: _pageController, controller: _tfController),
      QuestionView(index: 1, questions: tfQuestions, pageController: _pageController, controller: _tfController),
      QuestionView(index: 0, questions: jpQuestions, pageController: _pageController, controller: _jpController),
      QuestionView(index: 1, questions: jpQuestions, pageController: _pageController, controller: _jpController),
    ];
  }

  String calcSimpleMBTI(List<AnswerType> ei, List<AnswerType> sn, List<AnswerType> tf, List<AnswerType> jp) {
    String determinePreference(List<AnswerType> dichotomy, AnswerType option1, AnswerType option2) {
      int option1Count = dichotomy.where((answer) => answer == option1).length;
      int option2Count = dichotomy.length - option1Count;
      return option1Count >= option2Count
          ? option1.name // Use the enum name (e.g., "E")
          : option2.name; // Use the enum name (e.g., "I")
    }

    // Calculate each MBTI component
    String eOrI = determinePreference(ei, AnswerType.E, AnswerType.I);
    String sOrN = determinePreference(sn, AnswerType.S, AnswerType.N);
    String tOrF = determinePreference(tf, AnswerType.T, AnswerType.F);
    String jOrP = determinePreference(jp, AnswerType.J, AnswerType.P);

    return "$eOrI$sOrN$tOrF$jOrP";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          key: const ValueKey('quiz'),
          children: [
            PageView.builder(
              itemCount: pages.length,
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                    alignment: Alignment.topCenter,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: const BoxDecoration(color: Colors.black),
                    child: pages[index]);
              },
              onPageChanged: (index) {
                print(index);
                if (index == pages.length - 1) {
                  _mbtiType = calcSimpleMBTI(_eiController.getAnswers(), _snController.getAnswers(),
                      _tfController.getAnswers(), _jpController.getAnswers());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Results(mbtiResult: _mbtiType),
                    ),
                  );
                }
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

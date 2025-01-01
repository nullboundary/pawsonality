enum QuestionType {
  EI, // Extroverted Introvert
  SN, // Sensing Intuition
  TF, // Thinking Feeling
  JP, // Judging Perceiving
}

enum AnswerType {
  E, // Extroverted
  I, // Introvert
  S, // Sensing
  N, // Intuition
  T, // Thinking
  F, // Feeling
  J, // Judging
  P, // Perceiving
}

class Question {
  final String questionTitle;
  final String questionText;
  final QuestionType questionType;
  final List<String> answers;
  final List<AnswerType> answerTypes;
  final Map<String, String> answerDescriptions;

  Question({
    required this.questionTitle,
    required this.questionText,
    required this.questionType,
    required this.answers,
    required this.answerTypes,
    required this.answerDescriptions,
  });
}

final List<Question> eiQuestions = [
  Question(
    questionTitle: 'Extraversion vs. Introversion',
    questionText: 'At a dog-friendly café, does your dog:',
    questionType: QuestionType.EI,
    answers: ['Greet everyone', 'Sit quietly'],
    answerTypes: [AnswerType.E, AnswerType.I],
    answerDescriptions: {
      'Greet everyone': 'Greet everyone and ask for attention.',
      'Sit quietly': 'Sit quietly and focus on you.',
    },
  ),
  Question(
    questionTitle: 'Extraversion vs. Introversion',
    questionText: 'When meeting new people, does your dog:',
    questionType: QuestionType.EI,
    answers: ['Wag tail', 'Hide'],
    answerTypes: [AnswerType.E, AnswerType.I],
    answerDescriptions: {
      'Wag tail': 'Wag tail and approach happily.',
      'Hide': 'Hide behind you or stay away.',
    },
  ),
  Question(
    questionTitle: 'Extraversion vs. Introversion',
    questionText: 'During group play at the park, does your dog:',
    questionType: QuestionType.EI,
    answers: ['Middle', 'Outskirts'],
    answerTypes: [AnswerType.E, AnswerType.I],
    answerDescriptions: {
      'Middle': 'Dive into the middle of the group.',
      'Outskirts': 'Stay on the outskirts or play with just one friend.',
    },
  ),
];

final List<Question> snQuestions = [
  Question(
    questionTitle: 'Sensing vs. Intuition',
    questionText: 'If you hide a treat, does your dog:',
    questionType: QuestionType.SN,
    answers: ['Systematic', 'Guess'],
    answerTypes: [AnswerType.S, AnswerType.N],
    answerDescriptions: {
      'Systematic': 'Sniff systematically to locate it.',
      'Guess': 'Seem to guess its location or lose interest quickly.',
    },
  ),
  Question(
    questionTitle: 'Sensing vs. Intuition',
    questionText: 'When given a puzzle toy, does your dog:',
    questionType: QuestionType.SN,
    answers: ['Methodical', 'Experiment'],
    answerTypes: [AnswerType.S, AnswerType.N],
    answerDescriptions: {
      'Methodical': 'Methodically work through the puzzle to get the treat.',
      'Experiment': 'Experiment with different ways to solve it, even unconventional ones.',
    },
  ),
];

final List<Question> tfQuestions = [
  Question(
    questionTitle: 'Thinking vs. Feeling',
    questionText: 'When scolded for an accident indoors, does your dog:',
    questionType: QuestionType.TF,
    answers: ['Acknowledge', 'Upset'],
    answerTypes: [AnswerType.T, AnswerType.F],
    answerDescriptions: {
      'Acknowledge': 'Seem to acknowledge the rule they broke.',
      'Upset': 'Appear upset and try to comfort you.',
    },
  ),
  Question(
    questionTitle: 'Thinking vs. Feeling',
    questionText: 'If another dog growls at them, does your dog:',
    questionType: QuestionType.TF,
    answers: ['Respond', 'React'],
    answerTypes: [AnswerType.T, AnswerType.F],
    answerDescriptions: {
      'Respond': 'Respond assertively or disengage calmly.',
      'React': 'Act fearful or look for reassurance.',
    },
  ),
];

final List<Question> jpQuestions = [
  Question(
    questionTitle: 'Judging vs. Perceiving',
    questionText: 'Does your dog prefer:',
    questionType: QuestionType.JP,
    answers: ['Familiar', 'New'],
    answerTypes: [AnswerType.J, AnswerType.P],
    answerDescriptions: {
      'Familiar': 'Predictable walks on familiar routes.',
      'New': 'Exploring new paths and areas.',
    },
  ),
  Question(
    questionTitle: 'Judging vs. Perceiving',
    questionText: 'When playing a game like fetch, does your dog:',
    questionType: QuestionType.JP,
    answers: ['Rules', 'Unexpected'],
    answerTypes: [AnswerType.J, AnswerType.P],
    answerDescriptions: {
      'Rules': 'Stick with the rules (bringing the ball back every time).',
      'Unexpected': 'Change it up (run with the ball or drop it somewhere unexpected).',
    },
  ),
];

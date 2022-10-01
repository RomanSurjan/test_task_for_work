import 'dart:convert';

List<QuestionToDart> questionToDartFromJson(String str) => List<QuestionToDart>.from(json.decode(str).map((x) => QuestionToDart.fromJson(x)));



class QuestionToDart {
  QuestionToDart({
    required this.id,
    required this.question,
    this.description,
    required this.answers,
    required this.multipleCorrectAnswers,
    required this.correctAnswers,
    required this.correctAnswer,
    this.explanation,
    this.tip,
    required this.tags,
    required this.category,
    required this.difficulty,
  });

  int? id;
  String? question;
  dynamic description;
  Answers? answers;
  String? multipleCorrectAnswers;
  CorrectAnswers? correctAnswers;
  CorrectAnswer? correctAnswer;
  dynamic explanation;
  dynamic tip;
  List<Tag>? tags;
  String? category;
  Difficulty? difficulty;

  factory QuestionToDart.fromJson(Map<String?, dynamic> json) => QuestionToDart(
    id: json["id"],
    question: json["question"],
    description: json["description"],
    answers: Answers.fromJson(json["answers"]),
    multipleCorrectAnswers: json["multiple_correct_answers"],
    correctAnswers: CorrectAnswers.fromJson(json["correct_answers"]),
    correctAnswer: json["correct_answer"] == null ? null : correctAnswerValues.map[json["correct_answer"]],
    explanation: json["explanation"],
    tip: json["tip"],
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    category: json["category"],
    difficulty: difficultyValues.map[json["difficulty"]],
  );


}

class Answers {
  Answers({
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
    required this.answerE,
    required this.answerF,
  });

  String? answerA;
  String? answerB;
  String? answerC;
  String? answerD;
  String? answerE;
  String? answerF;

  factory Answers.fromJson(Map<String?, dynamic> json) => Answers(
    answerA: json["answer_a"],
    answerB: json["answer_b"],
    answerC: json["answer_c"],
    answerD: json["answer_d"],
    answerE: json["answer_e"],
    answerF: json["answer_f"],
  );
}

enum CorrectAnswer { answerA,answerB,answerC,answerD }

final correctAnswerValues = EnumValues({
  "answer_a": CorrectAnswer.answerA,
  "answer_b": CorrectAnswer.answerB,
  "answer_c": CorrectAnswer.answerC,
  "answer_d": CorrectAnswer.answerD,
});

class CorrectAnswers {
  CorrectAnswers({
    required this.answerACorrect,
    required this.answerBCorrect,
    required this.answerCCorrect,
    required this.answerDCorrect,
    required this.answerECorrect,
    required this.answerFCorrect,
  });

  String? answerACorrect;
  String? answerBCorrect;
  String? answerCCorrect;
  String? answerDCorrect;
  String? answerECorrect;
  String? answerFCorrect;

  factory CorrectAnswers.fromJson(Map<String?, dynamic> json) => CorrectAnswers(
    answerACorrect: json["answer_a_correct"],
    answerBCorrect: json["answer_b_correct"],
    answerCCorrect: json["answer_c_correct"],
    answerDCorrect: json["answer_d_correct"],
    answerECorrect: json["answer_e_correct"],
    answerFCorrect: json["answer_f_correct"],
  );

}

enum Difficulty { easy, medium, hard }

final difficultyValues = EnumValues({
  "Easy": Difficulty.easy,
  "Medium": Difficulty.medium,
  "Hard": Difficulty.hard,
});

class Tag {
  Tag({
    required this.name,
  });

  String? name;

  factory Tag.fromJson(Map<String?, dynamic> json) => Tag(
    name: json["name"],
  );

}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= reverseMap = map.map((k, v) => MapEntry(v, k));

    return reverseMap;
  }
}

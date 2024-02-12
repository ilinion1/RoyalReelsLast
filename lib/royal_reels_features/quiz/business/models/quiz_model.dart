import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuizModel {
  final List<QuestionModel> questions;
  QuizModel({
    required this.questions,
  });

  QuizModel copyWith({
    List<QuestionModel>? questions,
  }) {
    return QuizModel(
      questions: questions ?? this.questions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'questions': questions.map((x) => x.toMap()).toList(),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      questions: List<QuestionModel>.from(
        (map['questions'] as List).map<QuestionModel>(
          (x) => QuestionModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class QuestionModel {
  final String question;
  final Map<String, String> options;
  final String correctAnswer;
  QuestionModel({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'options': options,
      'correctAnswer': correctAnswer,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      question: map['question'] as String,
      options:
          Map<String, String>.from((map['options'] as Map<String, dynamic>)),
      correctAnswer: map['correctAnswer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

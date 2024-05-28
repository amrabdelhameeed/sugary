import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  final List<String> answers;
  final String question;
  String correctAnswer;

  QuestionModel({required this.answers, required this.question, this.correctAnswer = ""});

  Map<String, dynamic> toJson() {
    return {
      'answers': answers,
      'question': question,
      'correctAnswer': correctAnswer,
    };
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      answers: List<String>.from(json['answers']),
      question: json['question'],
      correctAnswer: json['correctAnswer'] ?? "",
    );
  }
}

extension QuestionModelListExtension on List<QuestionModel> {
  List<Map<String, dynamic>> toFirestoreList() {
    return map((question) => question.toJson()).toList();
  }
}

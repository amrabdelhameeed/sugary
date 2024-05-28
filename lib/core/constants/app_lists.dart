import 'package:sugar/core/models/question_model.dart';

class AppLists {
  static final List<QuestionModel> questions = [
    QuestionModel(
      answers: [
        "Type 1",
        "Type 2",
        "Gestational Diabetes (GDM)",
        "Not Sure",
      ],
      question: "Choose Diabetes",
      correctAnswer: "",
    ),
    QuestionModel(
      answers: [
        "Accu-Check Guide Me",
        "Accu-Check Instant",
        "Other device",
      ],
      question: "Which meter do you use?",
      correctAnswer: "",
    ),
    QuestionModel(
      answers: [
        "Syringes",
        "Pump",
        "No Pump",
      ],
      question: "Choose insulin therapy:",
      correctAnswer: "",
    ),
    QuestionModel(
      answers: [
        "mg/dL",
        "mmol/L",
        "g",
        "ex",
      ],
      question: "Choose insulin therapy units:",
      correctAnswer: "",
    ),
  ];
}

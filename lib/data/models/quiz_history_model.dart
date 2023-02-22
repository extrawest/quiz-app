import 'package:hive/hive.dart';

import 'quiz_result_model.dart';

part 'quiz_history_model.g.dart';

@HiveType(typeId: 1)
class QuizHistoryModel {
  const QuizHistoryModel({
    required this.date,
    required this.quizes,
  });

  @HiveField(0)
  final DateTime date;
  @HiveField(1)
  final List<QuizResultModel> quizes;

  String get key => date.toIso8601String();

  static const boxName = 'quizes';
}

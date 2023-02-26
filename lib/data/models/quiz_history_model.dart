import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'quiz_result_model.dart';

part 'quiz_history_model.g.dart';

@HiveType(typeId: 1)
class QuizHistoryModel extends Equatable {
  const QuizHistoryModel({
    required this.date,
    required this.quizes,
  });

  @HiveField(0)
  final DateTime date;
  @HiveField(1)
  final List<QuizResultModel> quizes;

  String get key => date.toIso8601String();

  int get rightCount => quizes.where((quiz) => quiz.isRight).length;

  static const boxName = 'quizes';

  @override
  List<Object?> get props => [date, quizes];
}

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'quiz_result_model.g.dart';

@HiveType(typeId: 0)
class QuizResultModel extends Equatable {
  const QuizResultModel({
    required this.question,
    required this.answer,
    required this.isRight,
  });

  @HiveField(0)
  final String question;
  @HiveField(1)
  final String answer;
  @HiveField(2)
  final bool isRight;

  @override
  List<Object?> get props => [question, answer, isRight];
}

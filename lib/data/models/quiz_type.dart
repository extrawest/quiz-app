enum QuizType {
  boolean,
  multiOptions;

  static QuizType fromString(String value) {
    switch (value) {
      case 'true-false':
        return QuizType.boolean;
      case 'multi-options':
        return QuizType.multiOptions;
      default:
        throw Exception('Invalid enum value');
    }
  }

  @override
  String toString() {
    switch (this) {
      case QuizType.boolean:
        return 'true-false';
      case QuizType.multiOptions:
        return 'multi-options';
    }
  }

  @override
  String displayName() {
    switch (this) {
      case QuizType.boolean:
        return 'True or False Quiz';
      case QuizType.multiOptions:
        return 'One Answer Quiz';
    }
  }
}

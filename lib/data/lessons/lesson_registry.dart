import '../../models/lesson_models.dart';
import 'day2_lesson1.dart';

class LessonRegistry {
  static final Map<int, LessonData> _lessons = {
    2: day2Lesson,
    // Add more lessons here as they are created:
    // 1: day1Lesson,
    // 3: day3Lesson,
    // etc.
  };

  static LessonData? getLesson(int day) {
    return _lessons[day];
  }

  static bool hasLesson(int day) {
    return _lessons.containsKey(day);
  }

  static List<int> get availableDays => _lessons.keys.toList()..sort();
}

import '../../models/lesson_models.dart';
import 'day2_lesson1.dart';
import 'day2_lesson2.dart';
import 'day2_lesson3.dart';
import 'day2_lesson4.dart';
import 'day2_lesson5.dart';
import 'day2_test.dart';

class LessonRegistry {
  // Map key format: "day-lesson" e.g., "2-1" for Day 2 Lesson 1
  static final Map<String, LessonData> _lessons = {
    '2-1': day2Lesson,
    '2-2': day2Lesson2,
    '2-3': day2Lesson3,
    '2-4': day2Lesson4,
    '2-5': day2Lesson5,
    '2-6': day2Test, // Day 2 Final Test
    // Add more lessons here as they are created:
    // '1-1': day1Lesson1,
    // '3-1': day3Lesson1,
    // etc.
  };

  // Legacy method - gets first lesson of day
  static LessonData? getLesson(int day) {
    return _lessons['$day-1'];
  }

  // Get specific lesson
  static LessonData? getLessonByNumber(int day, int lessonNumber) {
    return _lessons['$day-$lessonNumber'];
  }

  static bool hasLesson(int day) {
    return _lessons.keys.any((key) => key.startsWith('$day-'));
  }

  static bool hasLessonNumber(int day, int lessonNumber) {
    return _lessons.containsKey('$day-$lessonNumber');
  }

  // Get all lessons for a day
  static List<LessonData> getLessonsForDay(int day) {
    return _lessons.entries
        .where((e) => e.key.startsWith('$day-'))
        .map((e) => e.value)
        .toList();
  }

  static List<int> get availableDays {
    final days = _lessons.keys.map((k) => int.parse(k.split('-')[0])).toSet().toList();
    days.sort();
    return days;
  }
}

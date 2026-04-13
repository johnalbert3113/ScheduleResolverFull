import 'package:flutter/material.dart';
import '../models/task_model.dart';

class ScheduleProvider with ChangeNotifier {
  final List<TaskModel> _tasks = [];

  // Getter to fix the "tasks isn't defined" error in Dashboard
  List<TaskModel> get tasks => _tasks;

  // Method to fix the "addTask isn't defined" error in TaskInputScreen
  void addTask({
    required String title,
    required String category,
    required DateTime date,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    required int urgency,
    required int importance,
    required double estimatedEffortHours,
    required String energyLevel,
  }) {
    final newTask = TaskModel(
      id: DateTime.now().toIso8601String(),
      title: title,
      category: category,
      date: date,
      startTime: startTime,
      endTime: endTime,
      urgency: urgency,
      importance: importance,
      estimatedEffortHours: estimatedEffortHours,
      energyLevel: energyLevel,
    );

    _tasks.add(newTask);
    notifyListeners(); // This updates the UI
  }

  void removeTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}
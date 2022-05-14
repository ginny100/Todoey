import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  // A list of tasks
  List<Task> _tasks = [
    Task(name: 'Leetcode'),
    Task(name: 'HackerRank'),
    Task(name: 'CodeSignal'),
  ];

  // The task getter
  /* UnmodifiableListView is NOT a type of ListView.
   * In fact, it's another version of a list data type but it's kinda a view of another list */
  UnmodifiableListView<Task>? get tasks {
    return UnmodifiableListView(_tasks);
  }

  // The task counter
  /* The "get" keyword defines a getter */
  int get taskCount {
    return _tasks.length;
  }

  // Add new task
  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners(); // Update all the listeners on the latest state of the task object
  }

  // Update current tasks
  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners(); // Update all widgets that are listening to the currently done task
  }

  // Delete a finished task
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners(); // Update all widgets that are listening to the currently done task
  }
}

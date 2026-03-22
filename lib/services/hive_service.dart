import 'package:flutter/material.dart';
import 'package:hive_app/models/task.dart';
import 'package:hive_app/services/local_storage.dart';
import 'package:hive_flutter/adapters.dart';

class HiveService implements LocalStorage {
  static Future<void> initHive() async {
    await Hive.initFlutter('my_hive_app');    
    Hive.registerAdapter(TaskAdapter());
    await Hive.openBox<Task>('tasks');
  }

  _openTasksBox() {
    return Hive.box<Task>('tasks');
  }

  @override
  Future<void> addTask(Task task) async {
    Box tasksBox = _openTasksBox();
    await tasksBox.put(task.id,task);
  }

  @override
  Future<bool> deleteAllTask() async {
    try {
      Box tasksBox = _openTasksBox();
      await tasksBox.clear();
      return Future.value(true);
    } catch (e) {
      debugPrint(e.toString());
      return Future.value(false);
    }
  }

  @override
  Future<bool> deleteTask(Task task) async {
    try {
      Box tasksBox = _openTasksBox();
      await tasksBox.delete(task.id);
      return Future.value(true);
    } catch (e) {
      debugPrint(e.toString());
      return Future.value(false);
    }
  }

  @override
  List<Task> getAllTasks() {
    Box tasksBox = _openTasksBox();
    List<Task> allTasks = [];
    for (var task in tasksBox.values) {
      allTasks.add(task);
    }
    allTasks.sort((Task a, Task b) => b.createdAt.compareTo(a.createdAt));
    return allTasks;
  }

  @override
  Task getTask(String key) {
    Box tasksBox = _openTasksBox();
    return tasksBox.get(key);
  }

  @override
  Future<bool> updateTask(Task task) async {
    try {
      Box tasksBox = _openTasksBox();
      await tasksBox.put(task.id, task);
      return Future.value(true);
    } catch (e) {
      debugPrint(e.toString());
      return Future.value(false);
    }
  }
}

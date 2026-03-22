import 'package:hive_app/models/task.dart';

abstract class LocalStorage{
  Future<void> addTask(Task task);
  Task getTask(String key);
  List<Task> getAllTasks();
  Future<bool> deleteTask(Task task); 
  Future<bool> deleteAllTask();
  Future<bool> updateTask(Task task);
}



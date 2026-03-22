import 'package:hive_app/models/task.dart';
import 'package:hive_app/services/local_storage.dart';

class ServiceManager {
  final LocalStorage _localStorage;

  ServiceManager(this._localStorage);

  Future<void> addTask(Task task) async {
    return await _localStorage.addTask(task);
  }

  Task getTask(String key) {
    return _localStorage.getTask(key);
  }

  List<Task> getAllTask() {
    return _localStorage.getAllTasks();
  }

  Future<bool> deleteTask(Task task) async {
    return await _localStorage.deleteTask(task);
  }

  Future<bool> deleteAllTask() async {
    return await _localStorage.deleteAllTask();
  }

  Future<bool> updateTask(Task task) async {
    return await _localStorage.updateTask(task);
  }
}

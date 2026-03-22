// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject{  

  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final DateTime createdAt;
  
  @HiveField(2)
  String name;
  
  @HiveField(3)
  bool isCompleted;
  
  Task({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.isCompleted,
  });

  factory Task.create(String name,DateTime time){
    return Task(id:Uuid().v1(), createdAt: time, name: name, isCompleted:false);
  }
}


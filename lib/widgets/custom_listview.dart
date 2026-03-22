import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_app/models/task.dart';
import 'package:hive_app/services/get_it.dart';
import 'package:hive_app/services/service_manager.dart';
import 'package:hive_app/widgets/list_tile_item.dart';

class CustomListView extends StatelessWidget {
  final List<Task> allTasks;

  const CustomListView({super.key, required this.allTasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemBuilder: (context, index) {
        Task currentTask = allTasks[index];
        return Dismissible(
          key: Key(currentTask.id),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction) async {
            allTasks.remove(currentTask);
            var serviceManeger = GetItService.locator<ServiceManager>();
            await serviceManeger.deleteTask(currentTask);
          },
          background: Row(
            children: [
              Icon(Icons.delete),
              SizedBox(width: 5),
              Text("delete_task").tr(),
            ],
          ),
          child: ListTileItem(currentTask: currentTask),
        );
      },
      itemCount: allTasks.length,
    );
  }
}

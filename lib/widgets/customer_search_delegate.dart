import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_app/models/task.dart';
import 'package:hive_app/widgets/custom_listview.dart';


class CustomSearchDelegate extends SearchDelegate {
  final List<Task> allTasks;

  CustomSearchDelegate({required this.allTasks});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var filtredList =
        allTasks
            .where(
              (element) =>
                  element.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
    return filtredList.isNotEmpty
        ? CustomListView(allTasks: filtredList)
        : Center(child: Text("search_is_empty").tr());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return CustomListView(allTasks: allTasks);
    } else {
      var filtredList =
          allTasks
              .where(
                (element) =>
                    element.name.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
      return filtredList.isNotEmpty
          ? CustomListView(allTasks: filtredList)
          : Center(child: Text("search_is_empty").tr());
    }
  }
}

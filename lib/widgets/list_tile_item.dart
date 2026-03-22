import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_app/models/task.dart';
import 'package:hive_app/services/get_it.dart';
import 'package:hive_app/services/service_manager.dart';


class ListTileItem extends StatefulWidget {
  final Task currentTask;
  const ListTileItem({super.key, required this.currentTask});

  @override
  State<ListTileItem> createState() => _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  late final TextEditingController _controller;
  // ignore: prefer_typing_uninitialized_variables
  late final ServiceManager _serviceManager;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _serviceManager = GetItService.locator<ServiceManager>();
    _controller.text = widget.currentTask.name;
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _saveTask();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  @override
  void didUpdateWidget(covariant ListTileItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentTask.name != _controller.text) {
      _controller.text = widget.currentTask.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            blurStyle: BlurStyle.normal,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ListTile(
        title: TextField(
          focusNode: _focusNode,
          controller: _controller,
          maxLines: null,
          minLines: 1,
          onSubmitted: (value) async {
            widget.currentTask.name = value;
            await _serviceManager.updateTask(widget.currentTask);
          },
          decoration: InputDecoration(border: InputBorder.none),
          textInputAction: TextInputAction.done,
          style: TextStyle(
            decoration:
                widget.currentTask.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
          ),
        ),
        leading: Container(
          width: 32,
          decoration: BoxDecoration(
            color:
                widget.currentTask.isCompleted
                    ? Colors.green
                    : Colors.grey.shade100,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black),
          ),
          child: IconButton(
            icon: Icon(
              Icons.check,
              size: 16,
              color:
                  widget.currentTask.isCompleted
                      ? Colors.white
                      : Colors.grey.shade100,
            ),
            onPressed: () {
              widget.currentTask.isCompleted = !widget.currentTask.isCompleted;
              _serviceManager.updateTask(widget.currentTask);
              setState(() {});
            },
          ),
        ),
        trailing: Text(
          DateFormat('hh:mm a').format(widget.currentTask.createdAt),
        ),
      ),
    );
  }

  void _saveTask() {
    if (_controller.text != widget.currentTask.name) {
      widget.currentTask.name = _controller.text;
      _serviceManager.updateTask(widget.currentTask);
    }
  }
}

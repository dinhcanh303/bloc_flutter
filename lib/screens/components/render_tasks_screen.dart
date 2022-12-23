import 'package:flutter/material.dart';
import 'package:flutter_bloc_todos/models/task.dart';
import 'package:flutter_bloc_todos/widgets/widgets.dart';

class RenderTasks extends StatelessWidget {
  const RenderTasks({
    Key? key,
    required this.tasksList,
    required this.title,
  }) : super(key: key);

  final List<Task> tasksList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Chip(
            label: Text(title),
          ),
        ),
        TasksList(tasksList: tasksList)
      ],
    );
  }
}

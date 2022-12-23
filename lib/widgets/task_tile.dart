import 'package:flutter/material.dart';
import 'package:flutter_bloc_todos/blocs/blocs.dart';
import 'package:flutter_bloc_todos/models/task.dart';
import 'package:flutter_bloc_todos/widgets/popup_menu_render.dart';
import 'package:intl/intl.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTaskEvent(task: task))
        : context.read<TasksBloc>().add(RemoveTaskEvent(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              task.isFavorite!
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border_sharp),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      task.title,
                      style: TextStyle(
                          decoration:
                              task.isDone! ? TextDecoration.lineThrough : null),
                    ),
                    Text(
                      DateFormat()
                          .add_yMMMd()
                          .add_Hms()
                          .format(DateTime.parse(task.date)),
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: task.isDone,
              onChanged: task.isDeleted!
                  ? null
                  : (value) {
                      context
                          .read<TasksBloc>()
                          .add(UpdateTaskEvent(task: task));
                    },
            ),
            PopupMenuRender(
              task: task,
              removeOrDeleteTaskCallback: () =>
                  _removeOrDeleteTask(context, task),
              isFavoriteCallback: () => context
                  .read<TasksBloc>()
                  .add(MarkFavoriteTaskEvent(task: task)),
            )
          ],
        ),
      ],
    );
  }
}

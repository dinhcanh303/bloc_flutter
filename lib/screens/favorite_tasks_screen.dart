import 'package:flutter/material.dart';
import 'package:flutter_bloc_todos/blocs/blocs.dart';
import 'package:flutter_bloc_todos/models/task.dart';
import 'package:flutter_bloc_todos/screens/components/components.dart';
import 'package:flutter_bloc_todos/widgets/widgets.dart';

class FavoriteTasksScreen extends StatelessWidget {
  const FavoriteTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.favoriteTasks;
        return RenderTasks(
          tasksList: tasksList,
          title: "Favorite Tasks",
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc_todos/blocs/blocs.dart';
import 'package:flutter_bloc_todos/screens/my_drawer.dart';
import 'package:flutter_bloc_todos/widgets/widgets.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text('${state.removeTasks.length} Tasks'),
                ),
              ),
              TasksList(tasksList: state.removeTasks)
            ],
          ),
        );
      },
    );
  }
}

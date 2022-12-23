import 'package:flutter/material.dart';
import 'package:flutter_bloc_todos/blocs/blocs.dart';
import 'package:flutter_bloc_todos/routers/app_routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.grey[300],
              child: const Center(child: Text('Tasks Drawer')),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return ListTile(
                  title: const Text('My Task'),
                  leading: const Icon(Icons.folder_special),
                  trailing: Text(
                      '${state.pendingTasks.length} | ${state.completedTasks.length}'),
                  onTap: () => Navigator.pushReplacementNamed(
                      context, AppRoutes.tasksScreen),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return ListTile(
                  title: const Text('Recycle Bin'),
                  leading: const Icon(Icons.delete_rounded),
                  trailing: Text('${state.removeTasks.length}'),
                  onTap: () => Navigator.pushReplacementNamed(
                      context, AppRoutes.recycleBinScreen),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

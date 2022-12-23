import 'package:flutter/material.dart';
import 'package:flutter_bloc_todos/blocs/blocs.dart';
import 'package:flutter_bloc_todos/models/task.dart';
import 'package:flutter_bloc_todos/services/guid_gen.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({
    Key? key,
    required this.titleController,
    required this.descriptionController,
    required this.oldTask,
  }) : super(key: key);
  final Task oldTask;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          top: 20,
          left: 20,
          right: 20),
      child: Column(
        children: [
          const Text('Add Task'),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text('Title'),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: descriptionController,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
              label: Text('Description'),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    Task task = Task(
                      id: GuidGen.generate(),
                      title: titleController.text,
                      description: descriptionController.text,
                      date: DateTime.now().toString(),
                    );
                    context.read<TasksBloc>().add(AddTaskEvent(task: task));
                    Navigator.pop(context);
                  },
                  child: const Text('Save')),
            ],
          )
        ],
      ),
    );
  }
}

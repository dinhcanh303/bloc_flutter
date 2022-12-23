import 'package:flutter/material.dart';
import 'package:flutter_bloc_todos/models/task.dart';

class PopupMenuRender extends StatelessWidget {
  const PopupMenuRender({
    Key? key,
    required this.task,
    required this.removeOrDeleteTaskCallback,
    required this.isFavoriteCallback,
  }) : super(key: key);
  final Task task;
  final VoidCallback removeOrDeleteTaskCallback;
  final VoidCallback isFavoriteCallback;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted!
          ? (context) => [
                PopupMenuItem(
                  onTap: () {},
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.restore),
                      label: const Text('Restore')),
                ),
                PopupMenuItem(
                  onTap: removeOrDeleteTaskCallback,
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Delete Forever')),
                )
              ]
          : (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit')),
                ),
                PopupMenuItem(
                  onTap: isFavoriteCallback,
                  child: TextButton.icon(
                      onPressed: null,
                      icon: task.isFavorite!
                          ? const Icon(Icons.bookmark_remove)
                          : const Icon(Icons.bookmark_add),
                      label: task.isFavorite!
                          ? const Text('Remove Bookmark')
                          : const Text('Add Bookmark')),
                ),
                PopupMenuItem(
                  onTap: removeOrDeleteTaskCallback,
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete')),
                )
              ],
    );
  }
}

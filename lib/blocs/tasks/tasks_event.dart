part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TasksEvent {
  final Task task;
  const AddTaskEvent({required this.task});
}

class UpdateTaskEvent extends TasksEvent {
  final Task task;
  const UpdateTaskEvent({required this.task});
}

class DeleteTaskEvent extends TasksEvent {
  final Task task;
  const DeleteTaskEvent({required this.task});
}

class RemoveTaskEvent extends TasksEvent {
  final Task task;
  const RemoveTaskEvent({required this.task});
}

class MarkFavoriteTaskEvent extends TasksEvent {
  final Task task;
  const MarkFavoriteTaskEvent({required this.task});
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc_todos/screens/components/components.dart';
import 'package:flutter_bloc_todos/screens/screens.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': const PendingTasksScreen(), 'title': 'Pending Tasks'},
    {'pageName': const CompletedTasksScreen(), 'title': 'Completed Tasks'},
    {'pageName': const FavoriteTasksScreen(), 'title': 'Favorite Tasks'},
  ];

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: AddTaskScreen(
            titleController: titleController,
            descriptionController: descriptionController),
      ),
    );
  }

  int _selectedPageIndex = 0;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: [
          _selectedPageIndex == 0
              ? IconButton(
                  onPressed: () => _addTask(context),
                  icon: const Icon(Icons.add),
                )
              : const SizedBox.shrink(),
        ],
      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.incomplete_circle_sharp),
                label: "Pending Tasks"),
            BottomNavigationBarItem(
                icon: Icon(Icons.done), label: "Completed Tasks"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite Tasks"),
          ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc_todos/blocs/blocs.dart';
import 'package:flutter_bloc_todos/routers/app_router.dart';
import 'package:flutter_bloc_todos/routers/app_routes.dart';
import 'package:flutter_bloc_todos/screens/peding_tasks_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TasksBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.tasksScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}

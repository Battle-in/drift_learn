import 'package:drift_clear_learn/data/database/project_database.dart';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    home: ShowData(),
  ));
}

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {

  late ProjectDatabase database;

   @override
  Widget build(BuildContext context) {
    database = ProjectDatabase();

    return Scaffold(
      appBar: AppBar(title: Text('title'),),
      body: FutureBuilder(future: getAllData(), builder: (context, data){
        if (data.data == null){
          return Center(child: CircularProgressIndicator(),);
        } else if (data.error != null){
          return Center(child: Text(data.error.toString()),);
        } else {
          if (data.data is! ScreenState || data.data == null){
            throw Exception('Неверное состояние');
          }

          final ScreenState state = data.data ?? ScreenState(
            users: [], projects: [], tasks: []);

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 200, child: Column(
                children: [
                  TextButton(onPressed: createUser, child: Text('create User')),
                  TextButton(
                    onPressed: createProject, 
                    child: Text('create project for first user'),
                  ),
                  TextButton(
                    onPressed: createTaskForFirstProject, 
                    child: Text('create Task For first project'),
                  ),
                  TextButton(
                    onPressed: setAllTaskCompleate, 
                    child: Text('set all tasks compleate'),
                  ),
                ],
              ),),),
              SliverList(delegate: SliverChildBuilderDelegate(
                (context, i) => Text(state.users[i].toString()),
                childCount: state.users.length,
              ),),
            ],
          );
        }
      }),
    );
  }

  Future<ScreenState> getAllData() async{
    final users = await database.userDao.getAll();
    final projects = await database.projectsDao.getAll();
    final tasks = await database.taskDao.getAll();

    return ScreenState(users: users, projects: projects, tasks: tasks);
  }

  Future<void> createUser() async => await database.userDao.putUser();

  Future<void> createProject() async => await database.projectsDao.putProject();

  Future<void> createTaskForFirstProject() async => 
    await database.taskDao.putTask();

  Future<void> setAllTaskCompleate() async => 
    await database.transaction(() async {
      await (database.update(database.taskTable)
        ..where((task) => task.isCompleate.equals(false)))
        .write(const TaskTableCompanion(isCompleate: drift.Value(true)));
    });
}

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ScreenState{
  final List<UserTableData> users;
  final List<ProjectsTableData> projects;
  final List<TaskTableData> tasks;

  const ScreenState({
    required this.users, 
    required this.projects, 
    required this.tasks});
}
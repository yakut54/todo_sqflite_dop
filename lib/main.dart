import 'package:flutter/material.dart';
import 'package:todo_list/DB/db.dart';
import 'package:todo_list/DB/todo_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo>? _todoList;

  @override
  void initState() {
    _loadDB();
    super.initState();
  }

  _loadDB() async {
    _todoList = await LDB().getTodos();
    print(_todoList?[0]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('widget.title'),
        ),
        body: Center(
          child: (_todoList == null)
              ? Container(
                  color: Colors.white,
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                    backgroundColor: Colors.white,
                    strokeWidth: 10,
                  ),
                )
              : ListView.builder(
                  itemCount: _todoList?.length,
                  itemBuilder: (context, idx) {
                    return ListTile(
                      leading: const Icon(Icons.add_alarm),
                      title: Text('${_todoList?[idx].name}'),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete),
                      ),
                    );
                  },
                ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () async {
                await LDB().deleteAllTodo();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.delete_forever),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () async {
                await LDB().deleteTodo(1);
              },
              tooltip: 'Increment',
              child: const Icon(Icons.delete),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () async {
                final todos = await LDB().getTodos();

                print('todos');
                print(todos);
              },
              tooltip: 'Increment',
              child: const Icon(Icons.read_more),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () async {
                print(DateTime.now().millisecondsSinceEpoch);

                await LDB().insertTodo(
                  const Todo(
                      isDone: 0,
                      name: 'rrr2',
                      begin: 122345,
                      deadline: 32323233223),
                );
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () async {
                await LDB().updateTodo(
                  const Todo(
                      id: 1,
                      isDone: 1,
                      name: 'Yakut',
                      begin: 122345,
                      deadline: 32323233223),
                );
              },
              tooltip: 'Increment',
              child: const Icon(Icons.update),
            ),
          ],
        ));
  }
}

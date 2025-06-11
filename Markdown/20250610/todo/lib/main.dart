import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoリスト',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<TodoItem> _todos = [];
  final TextEditingController _textController = TextEditingController();

  void _addTodo(String title) {
    if (title.isNotEmpty) {
      setState(() {
        _todos.add(
          TodoItem(
            title: title,
            isCompleted: false,
            progress: Progress.notStarted,
          ),
        );
      });
      _textController.clear();
    }
  }

  void _toggleTodo(int index) {
    setState(() {
      _todos[index].isCompleted = !_todos[index].isCompleted;
      if (_todos[index].isCompleted) {
        _todos[index].progress = Progress.completed;
      } else {
        _todos[index].progress = Progress.notStarted;
      }
    });
  }

  void _updateProgress(int index, Progress progress) {
    setState(() {
      _todos[index].progress = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDoリスト'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: '追加したいタスクを入力してください',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _addTodo(_textController.text),
                  child: const Text('追加'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final todo = _todos[index];
                return Card(
                  color: _getColorForProgress(todo.progress),
                  child: ListTile(
                    leading: Checkbox(
                      value: todo.isCompleted,
                      onChanged: (_) => _toggleTodo(index),
                    ),
                    title: Text(todo.title),
                    trailing: DropdownButton<Progress>(
                      value: todo.progress,
                      items:
                          Progress.values.map((progress) {
                            return DropdownMenuItem(
                              value: progress,
                              child: Text(_getProgressLabel(progress)),
                             );
                          }).toList(),
                      onChanged: (Progress? newValue) {
                        if (newValue != null) {
                          _updateProgress(index, newValue);
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _getColorForProgress(Progress progress) {
    switch (progress) {
      case Progress.notStarted:
        return Colors.red.shade100;
      case Progress.inProgress:
        return Colors.yellow.shade100;
      case Progress.completed:
        return Colors.green.shade100;
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

enum Progress { notStarted, inProgress, completed }

class TodoItem {
  String title;
  bool isCompleted;
  Progress progress;

  TodoItem({
    required this.title,
    required this.isCompleted,
    required this.progress,
  });
}

String _getProgressLabel(Progress progress) {
  switch (progress) {
    case Progress.notStarted:
      return '未着手';
    case Progress.inProgress:
      return '進行中';
    case Progress.completed:
      return '完了';
  }
}
import 'package:flutter/material.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {
    final groupKey = ModalRoute.of(context)!.settings.arguments as int;

    return _TasksWidgetBody();
  }
}

class _TasksWidgetBody extends StatelessWidget {
  const _TasksWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Tasks'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: _TasksWidgetList(),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/groups/form');
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(
          Icons.add_box_outlined,
          size: 34,
        ),
      ),
    );
  }
}

class _TasksWidgetList extends StatelessWidget {
  const _TasksWidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => _TasksWidgetListRow(indexList: index),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10);
  }
}

class _TasksWidgetListRow extends StatelessWidget {
  final int indexList;
  const _TasksWidgetListRow({super.key, required this.indexList});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Text $indexList'),
    );
  }
}

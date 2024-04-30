import 'package:flutter/material.dart';

class TaskFormWidget extends StatefulWidget {
  const TaskFormWidget({super.key});

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  @override
  Widget build(BuildContext context) {
    return TaskFormWidgetBody();
  }
}

class TaskFormWidgetBody extends StatelessWidget {
  const TaskFormWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Добавление новой задачи'),
      ),
      body: SafeArea(child: Center(child: _TaskFormField())),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        // GroupsFormWidgetProvider.read(context)?.model.saveGroup(context),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.done,
          size: 30,
        ),
      ),
    );
  }
}

class _TaskFormField extends StatelessWidget {
  const _TaskFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      // onChanged: (value) => model?.title = value,
      // onEditingComplete: () => model?.saveGroup(context),
      autofocus: true,
      decoration: InputDecoration(
          hintText: 'название таски', border: OutlineInputBorder()),
    );
  }
}

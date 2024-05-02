import 'package:flutter/material.dart';
import 'package:todo_list/ui/widgets/task_form/task_form_widget_model.dart';

class TaskFormWidget extends StatefulWidget {
  final int groupKey;
  const TaskFormWidget({
    super.key,
    required this.groupKey,
  });

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  late final TaskFormWidgetModel _model;

  @override
  void initState() {
    super.initState();
    _model = TaskFormWidgetModel(groupKey: widget.groupKey);
  }

  @override
  Widget build(BuildContext context) {
    return TaskFormWidgetModelProvider(
      model: _model,
      child: const TaskFormWidgetBody(),
    );
  }
}

class TaskFormWidgetBody extends StatelessWidget {
  const TaskFormWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = TaskFormWidgetModelProvider.read(context)?.model;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Добавление новой задачи'),
      ),
      body: const SafeArea(
          child: Center(
              child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: _TaskFormField(),
      ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => model?.saveTask(context),
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
    final model = TaskFormWidgetModelProvider.read(context)?.model;
    return TextField(
      onChanged: (value) => model?.taskText = value,
      onEditingComplete: () => model?.saveTask(context),
      autofocus: true,
      maxLines: null,
      minLines: null,
      expands: true,
      decoration: const InputDecoration(
        hintText: 'Название таски',
        border: InputBorder.none,
      ),
    );
  }
}

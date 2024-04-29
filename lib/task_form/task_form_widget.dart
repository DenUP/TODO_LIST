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
    return const Placeholder();
  }
}

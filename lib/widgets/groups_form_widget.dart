import 'package:flutter/material.dart';
import 'package:todo_list/model/groups_form_widget_model.dart';
import 'package:todo_list/model/groups_widget_model.dart';

class GroupsFormWidget extends StatefulWidget {
  const GroupsFormWidget({super.key});

  @override
  State<GroupsFormWidget> createState() => _GroupsFormWidgetState();
}

class _GroupsFormWidgetState extends State<GroupsFormWidget> {
  final _model = GroupsFormWidgetModel();
  @override
  Widget build(BuildContext context) {
    return GroupsFormWidgetProvider(
        model: _model, child: _GroupsFormWidgetBody());
  }
}

class _GroupsFormWidgetBody extends StatelessWidget {
  const _GroupsFormWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Новая группа'),
      ),
      body: SafeArea(child: Center(child: _GroupsFormField())),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            GroupsFormWidgetProvider.read(context)?.model.saveGroup(context),
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

class _GroupsFormField extends StatelessWidget {
  const _GroupsFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = GroupsFormWidgetProvider.read(context)?.model;
    return TextField(
      onChanged: (value) => model?.title = value,
      onEditingComplete: () => model?.saveGroup(context),
      autofocus: true,
      decoration: InputDecoration(
          hintText: 'название группы', border: OutlineInputBorder()),
    );
  }
}
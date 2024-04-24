import 'dart:js';

import 'package:flutter/material.dart';
import 'package:todo_list/model/groups_form_widget_model.dart';

class GroupsFormWidgetBody extends StatefulWidget {
  const GroupsFormWidgetBody({super.key});

  @override
  State<GroupsFormWidgetBody> createState() => _GroupsFormWidgetBodyState();
}

class _GroupsFormWidgetBodyState extends State<GroupsFormWidgetBody> {
  final _model = GroupFormWidgetModel();
  @override
  Widget build(BuildContext context) {
    return GroupFormWidgetModelProvider(
      model: _model,
      child: GroupsFormWidget(),
    );
  }
}

class GroupsFormWidget extends StatelessWidget {
  const GroupsFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новая группа'),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_GroupsFormField()],
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GroupFormWidgetModelProvider.read(context)
            ?.model
            .saveGroup(context),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(
          Icons.done,
          size: 28,
        ),
      ),
    );
  }
}

class _GroupsFormField extends StatelessWidget {
  const _GroupsFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlue, width: 1)),
          focusColor: Colors.blue),
    );
  }
}

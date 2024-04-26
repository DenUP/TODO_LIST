import 'package:flutter/material.dart';

class GroupsFormWidget extends StatefulWidget {
  const GroupsFormWidget({super.key});

  @override
  State<GroupsFormWidget> createState() => _GroupsFormWidgetState();
}

class _GroupsFormWidgetState extends State<GroupsFormWidget> {
  @override
  Widget build(BuildContext context) {
    return _GroupsFormWidgetBody();
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
        onPressed: () {},
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
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
          hintText: 'название группы', border: OutlineInputBorder()),
    );
  }
}

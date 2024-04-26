import 'package:flutter/material.dart';
import 'package:todo_list/model/groups_widget_model.dart';

class GroupsWidget extends StatefulWidget {
  const GroupsWidget({super.key});

  @override
  State<GroupsWidget> createState() => _GroupsWidgetState();
}

class _GroupsWidgetState extends State<GroupsWidget> {
  final _model = GroupsWidgetModel();
  @override
  Widget build(BuildContext context) {
    return GroupsWidgetProvider(
      model: _model,
      child: const _GroupsWidgetBody(),
    );
  }
}

class _GroupsWidgetBody extends StatelessWidget {
  const _GroupsWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Группы'),
      ),
      body: SafeArea(child: _GroupsWidgetList()),
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

class _GroupsWidgetList extends StatelessWidget {
  const _GroupsWidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => _GroupsWidgetListRow(
              indexList: index,
            ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount:
            GroupsWidgetProvider.watch(context)?.model.group.length ?? 0);
  }
}

class _GroupsWidgetListRow extends StatelessWidget {
  final int indexList;
  const _GroupsWidgetListRow({super.key, required this.indexList});

  @override
  Widget build(BuildContext context) {
    final model = GroupsWidgetProvider.read(context)!.model;
    final group = model.group[indexList];
    return ListTile(
      title: Text(group.name),
    );
  }
}

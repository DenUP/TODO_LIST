import 'package:flutter/material.dart';
import 'package:todo_list/model/groups_widget_model.dart';

class GroupWidget extends StatefulWidget {
  const GroupWidget({super.key});

  @override
  State<GroupWidget> createState() => _GroupWidgetState();
}

class _GroupWidgetState extends State<GroupWidget> {
  final _model = GroupsWidgetModel();

  @override
  Widget build(BuildContext context) {
    return GroupsWidgetProvider(
      model: _model,
      child: _GroupWidgetBody(),
    );
  }
}

class _GroupWidgetBody extends StatelessWidget {
  const _GroupWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Группы'),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: _GroupWidgetList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_box_sharp,
          size: 30,
        ),
        onPressed: () =>
            GroupsWidgetProvider.read(context)?.model.showFrom(context),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class _GroupWidgetList extends StatelessWidget {
  const _GroupWidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    final groupsCount =
        GroupsWidgetProvider.watch(context)?.model.groups.length ?? 0;
    return ListView.separated(
      itemBuilder: (context, index) {
        return _GroupWidgetListRow(indexList: index);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: groupsCount,
    );
  }
}

class _GroupWidgetListRow extends StatelessWidget {
  final int indexList;
  const _GroupWidgetListRow({super.key, required this.indexList});

  @override
  Widget build(BuildContext context) {
    final model = GroupsWidgetProvider.read(context)?.model;
    final group = model!.groups[indexList];
    return SizedBox(
      child: ListTile(
        onTap: () {},
        title: Text(group.name),
      ),
    );
  }
}

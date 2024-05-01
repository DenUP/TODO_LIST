import 'package:flutter/material.dart';
import 'package:todo_list/model/groups_widget_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
    final _model = GroupsWidgetProvider.watch(context)?.model;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Группы'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: _GroupsWidgetList(),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _model?.showFrom(context),
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
    final _model = GroupsWidgetProvider.read(context)!.model;
    // final _del_items = _model.delItem(indexList);
    final group = _model.group[indexList];
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: null,
            backgroundColor: Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Изменить',
          ),
          SlidableAction(
            onPressed: (context) => _model.delItem(indexList),
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Удалить',
          ),
        ],
      ),
      child: ListTile(
        title: Text(group.name),
        onTap: () => _model.showTask(context, indexList),
      ),
    );
  }
}

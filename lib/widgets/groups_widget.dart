import 'package:flutter/material.dart';
import 'package:todo_list/model/groups_form_widget_model.dart';

final _model = GroupFormWidgetModel();

class GroupWidget extends StatefulWidget {
  const GroupWidget({super.key});

  @override
  State<GroupWidget> createState() => _GroupWidgetState();
}

class _GroupWidgetState extends State<GroupWidget> {
  @override
  Widget build(BuildContext context) {
    return GroupFormWidgetModelProvider(
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
        onPressed: () => Navigator.of(context).pushNamed('/groups/form'),
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
    return ListView.separated(
        itemBuilder: (context, index) {
          return _GroupWidgetListRow(
            indexList: index,
          );
        },
        separatorBuilder: (context, index) => const Divider(
              height: 5,
            ),
        itemCount: 20);
  }
}

class _GroupWidgetListRow extends StatelessWidget {
  final int indexList;
  const _GroupWidgetListRow({super.key, required this.indexList});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Title $indexList'),
    );
  }
}

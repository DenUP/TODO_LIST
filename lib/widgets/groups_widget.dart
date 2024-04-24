import 'package:flutter/material.dart';

class GroupWidget extends StatelessWidget {
  const GroupWidget({super.key});

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

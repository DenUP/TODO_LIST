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
      child: const _GroupsFormWidget(),
    );
  }
}

class _GroupsFormWidget extends StatefulWidget {
  const _GroupsFormWidget({super.key});

  @override
  State<_GroupsFormWidget> createState() => _GroupsFormWidgetState();
}

class _GroupsFormWidgetState extends State<_GroupsFormWidget> {
  TextEditingController nameController = TextEditingController();
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
            children: [
              TextField(
                autofocus: true,
                controller: nameController,
                onEditingComplete: () =>
                    GroupFormWidgetModelProvider.read(context)
                        ?.model
                        .saveGroup(context, nameController.text),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.lightBlue, width: 1)),
                    focusColor: Colors.blue),
              )
            ],
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GroupFormWidgetModelProvider.read(context)
            ?.model
            .saveGroup(context, nameController.text),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(
          Icons.done,
          size: 28,
        ),
      ),
    );
  }
}

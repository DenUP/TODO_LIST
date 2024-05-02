import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list/ui/widgets/tasks/tasks_widget_model.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  TasksWidgetModel? _model;
  @override
  void didChangeDependencies() {
    if (_model == null) {
      final groupKey = ModalRoute.of(context)!.settings.arguments as int;
      _model = TasksWidgetModel(groupkey: groupKey);
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return TasksWidgetModelProvider(
      model: _model!,
      child: _TasksWidgetBody(),
    );
  }
}

class _TasksWidgetBody extends StatelessWidget {
  const _TasksWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = TasksWidgetModelProvider.watch(context)?.model;
    final group = model?.group?.name ?? 'Задачи';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(group),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: _TasksWidgetList(),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => model?.showFrom(context),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(
          Icons.add_task_sharp,
          size: 34,
        ),
      ),
    );
  }
}

class _TasksWidgetList extends StatelessWidget {
  const _TasksWidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    final itemCount =
        TasksWidgetModelProvider.watch(context)?.model.tasks.length ?? 0;
    return ListView.separated(
        itemBuilder: (context, index) => _TasksWidgetListRow(indexList: index),
        separatorBuilder: (context, index) => const Divider(
              height: 1,
            ),
        itemCount: itemCount);
  }
}

class _TasksWidgetListRow extends StatelessWidget {
  final int indexList;
  const _TasksWidgetListRow({super.key, required this.indexList});

  @override
  Widget build(BuildContext context) {
    final _model = TasksWidgetModelProvider.read(context)!.model;
    final task = _model.tasks[indexList];
    final icon =
        task.isDone ? Icons.check_box_outlined : Icons.check_box_outline_blank;
    final textisDone = task.isDone
        ? const TextStyle(decoration: TextDecoration.lineThrough)
        : null;
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          const SlidableAction(
            onPressed: null,
            backgroundColor: Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Изменить',
          ),
          SlidableAction(
            onPressed: (context) => _model.deleteTask(indexList),
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Удалить',
          ),
        ],
      ),
      child: ListTile(
        onTap: () => _model.task_isDone(indexList),
        title: Text(
          task.name,
          style: textisDone,
        ),
        trailing: Icon(icon),
      ),
    );
  }
}

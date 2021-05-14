import 'package:flutter/material.dart';
import 'package:google_tarefas/models/task_model.dart';
import 'package:google_tarefas/pages/task_page.dart';

import 'package:google_tarefas/widgets/task_item_widget.dart';

class TaskBlockWidget extends StatefulWidget {
  final TaskModel task;

  const TaskBlockWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  _TaskBlockWidgetState createState() => _TaskBlockWidgetState();
}

class _TaskBlockWidgetState extends State<TaskBlockWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          TaskItemWidget(
            title: widget.task.taskName,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaskPage(task: widget.task)));
            },
          ),
          if (widget.task.subTasks != null)
            for (var i = 0; i < widget.task.subTasks!.length; i++)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TaskItemWidget(
                  title: widget.task.subTasks![i].taskName,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TaskPage(task: widget.task.subTasks![i])));
                  },
                ),
              )
        ],
      ),
    );
  }
}

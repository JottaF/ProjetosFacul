import 'package:flutter/material.dart';
import 'package:google_tarefas/widgets/completed_task_widget.dart';

class DropDownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Concluídas (2)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
              icon: Icon(Icons.keyboard_arrow_up_rounded),
              onPressed: () {},
            ),
          ],
        ),
        CompletedTaskWidget(task: 'task'),
        CompletedTaskWidget(task: 'task'),
      ],
    );
  }
}

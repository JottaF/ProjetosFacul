import 'package:flutter/material.dart';
import 'package:google_tarefas/widgets/task_item_widget.dart';
import 'package:ionicons/ionicons.dart';

import 'package:google_tarefas/models/task_model.dart';

class TaskPage extends StatelessWidget {
  final TaskModel task;

  const TaskPage({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(Ionicons.trash_outline, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'My Tasks',
                      style: TextStyle(color: Colors.grey),
                    )),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.taskName,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.menu,
                      color: Color(0xFF5d5d5d),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Adicionar detalhes',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF5d5d5d),
                          ),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Ionicons.calendar_clear_outline,
                      color: Color(0xFF5d5d5d),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Adicionar data/hora',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF5d5d5d),
                          ),
                        )),
                  ],
                ),
                task.subTasks == null
                    ? Row(
                        children: [
                          Icon(
                            Icons.subdirectory_arrow_right,
                            color: Color(0xFF5d5d5d),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Adicionar subtarefas',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF5d5d5d),
                                ),
                              )),
                        ],
                      )
                    : task.subTasks!.length == 1
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.subdirectory_arrow_right,
                                    color: Color(0xFF5d5d5d),
                                  ),
                                  TaskItemWidget(
                                      title: task.subTasks![0].taskName),
                                ],
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text('Adicionar subtarefas',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF5d5d5d),
                                      ))),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.subdirectory_arrow_right,
                                    color: Color(0xFF5d5d5d),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: TaskItemWidget(
                                        title: task.subTasks![0].taskName),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: Column(
                                  children: [
                                    for (var i = 1;
                                        i < task.subTasks!.length;
                                        i++)
                                      SizedBox(
                                        height: 40,
                                        child: TaskItemWidget(
                                            title: task.subTasks![i].taskName),
                                      ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text('Adicionar subtarefas',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF5d5d5d),
                                            )))
                                  ],
                                ),
                              )
                            ],
                          )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black54.withOpacity(0.2),
            blurRadius: 10,
          )
        ]),
        child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Concluída',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

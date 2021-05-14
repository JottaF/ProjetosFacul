import 'package:flutter/material.dart';
import 'package:google_tarefas/pages/drop_down_page.dart';
import 'package:google_tarefas/models/task_model.dart';
import 'package:google_tarefas/pages/task_page.dart';
import 'package:google_tarefas/widgets/task_block_widget.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'My Tasks',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CircleAvatar(
              backgroundColor: Colors.black,
            ),
          )
        ],
        elevation: 0,
      ),
      body: PageView(children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TaskBlockWidget(
                    task: TaskModel(
                      taskName: 'Web atividade',
                      subTasks: [
                        TaskModel(taskName: 'Web 3'),
                        TaskModel(taskName: 'Web 4'),
                      ],
                    ),
                  ),
                  TaskBlockWidget(
                    task: TaskModel(
                      taskName: 'Web atividade',
                      subTasks: [
                        TaskModel(taskName: 'Web 3'),
                        TaskModel(taskName: 'Web 4'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: DropDownPage(),
            ),
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black54.withOpacity(0.2), blurRadius: 10)
        ]),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          elevation: 0,
          notchMargin: 5,
          child: Container(
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.menu_sharp,
                      color: Color(0xFF5d5d5d),
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Ionicons.ellipsis_vertical,
                      color: Color(0xFF5d5d5d),
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

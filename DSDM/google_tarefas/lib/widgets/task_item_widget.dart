import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class TaskItemWidget extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;

  const TaskItemWidget({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  _TaskItemWidgetState createState() => _TaskItemWidgetState();
}

class _TaskItemWidgetState extends State<TaskItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        children: [
          Icon(Ionicons.ellipse_outline),
          SizedBox(
            width: 10,
          ),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}

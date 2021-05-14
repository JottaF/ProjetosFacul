import 'package:flutter/material.dart';

class CompletedTaskWidget extends StatelessWidget {
  final String task;

  const CompletedTaskWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(
            Icons.check,
            color: Colors.blue,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            task,
            style: TextStyle(
              fontSize: 20,
              decoration: TextDecoration.lineThrough,
            ),
          )
        ],
      ),
    );
  }
}

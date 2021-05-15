import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final onChange;

  const InputWidget({
    Key? key,
    required this.label,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: label,
      ),
    );
  }
}

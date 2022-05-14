import 'package:flutter/material.dart';

// The StatefulWidget
class TaskTile extends StatelessWidget {
  // Property
  final String taskTitle;
  final bool isChecked;
  final Function(bool?)? checkboxCallback;
  final Function() longPressCallback;

  // Constructor
  TaskTile({
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      onLongPress: longPressCallback,
      trailing: Checkbox(
        activeColor: Colors.tealAccent[700],
        value: isChecked,
        onChanged: checkboxCallback,
        // A new value of the checkbox is sent over to onChanged
        // onChanged: toggleCheckboxState,
      ),
    );
  }
}

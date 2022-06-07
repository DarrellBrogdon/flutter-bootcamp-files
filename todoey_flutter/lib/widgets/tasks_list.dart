import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final taskItem = taskData.tasks[index];
            return GestureDetector(
              onLongPress: () {
                taskData.removeTask(taskItem);
              },
              onHorizontalDragEnd: (_) {
                taskData.removeTask(taskItem);
              },
              child: TaskTile(
                isChecked: taskItem.isDone,
                taskTitle: taskItem.name,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(taskItem);
                },
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

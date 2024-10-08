import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'TaskController.dart';
import 'models/TaskModel.dart';

class TaskListView extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    taskController.loadTasks(); // Load tasks when the screen opens

    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              TaskModel task = TaskModel(
                title: "ini title",
                description: "ini desc",
              );
              taskController.addTask(task);
            },
            child: Text('Add Task'),
          ),
          Expanded(child: Obx(() {
            return ListView.builder(
              itemCount: taskController.tasks.length,
              itemBuilder: (context, index) {
                final task = taskController.tasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  trailing: Icon(Icons.delete),
                  onTap: () {
                    taskController.deleteTask(task.id!);
                  },
                );
              },
            );
          }))
        ],
      ),
    );
  }
}

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/modals/Task_modal.dart';
import 'package:taskmanagement/widgets/constant.dart';
import 'package:taskmanagement/widgets/detail.dart';

class Tasks extends StatelessWidget {
  final taskList = Task.generateTasks();

  Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
          itemCount: taskList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) => taskList[index].isLast
              ? _buildAddTask()
              : _buildTask(context, taskList[index])),
    );
  }
}

Widget _buildAddTask() {
  return DottedBorder(
    child: Center(
      child: Icon(
        Icons.add,
        size: 30,
        color: Colors.grey.shade600,
      ),
    ),
    borderType: BorderType.RRect,
    radius: Radius.circular(20),
    color: Colors.grey.shade600,
    strokeWidth: 2,
    dashPattern: [10, 10],
  );
}

Widget _buildTask(BuildContext context, Task taskList) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailPage(taskList)));
    },
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: taskList.bgcolor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            taskList.icon,
            color: taskList.iconcolor,
            size: 30,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            taskList.title.toString(),
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              _buildTaskStatus(taskList.btncolor!, taskList.iconcolor!,
                  '${taskList.left} left'),
              const SizedBox(
                width: 10,
              ),
              _buildTaskStatus(
                  kwhite, taskList.iconcolor!, '${taskList.done} done'),
            ],
          )
        ],
      ),
    ),
  );
}

Widget _buildTaskStatus(Color bgcolor, Color txtColor, String txt) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration:
        BoxDecoration(color: bgcolor, borderRadius: BorderRadius.circular(15)),
    child: Text(
      txt,
      style: TextStyle(
        color: txtColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

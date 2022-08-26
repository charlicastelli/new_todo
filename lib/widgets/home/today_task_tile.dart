import 'package:flutter/material.dart';
import 'package:new_todo/models/task_model.dart';
import 'package:new_todo/utils/constants.dart';

class TodayTaskTile extends StatelessWidget {
  const TodayTaskTile({Key? key, required this.task}) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 230,
        height: 200,
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colors[task.color as int].withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(task.title.toString(), style: kTextStyleBoldWhite(20.0)),
            Text(task.description.toString(),
                style: kTextStyleBoldWhite(16), maxLines: 2),
            Text(task.time.toString(), style: kTextStyleBoldWhite(16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.status.toString(),
                  style: kTextStyleBoldWhite(20),
                ),
                Icon(
                  task.isFavorite == 1 ? Icons.favorite_outlined : null,
                  color: Colors.redAccent,
                  //color: colors[task.color as int],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

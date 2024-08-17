import 'package:flutter/material.dart';
import 'package:project_todo/Model/todo_dm.dart';
import 'package:project_todo/UI/Utils/app_color.dart';
import 'package:project_todo/ui/utils/App_Style.dart';

class Todo extends StatelessWidget 
 {
  final Todo_DM item;

  const Todo({super.key, required this.item});

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      height: MediaQuery.of(context).size.height * .13,
      decoration: BoxDecoration
      (
        color: Colors.white, 
        borderRadius: BorderRadius.circular(22)
      ),
      margin: EdgeInsets.symmetric(vertical: 22, horizontal: 26),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Row
      (
        children: 
        [
          buildVerticalLine(context),

          SizedBox(width: 25,),

          buildTodoInfo(),
          buildTodoState()
        ],
      )
    );
  }

  buildVerticalLine(BuildContext context) => Container
  (
    height: MediaQuery.of(context).size.height * .07,
    width: 4,
    decoration: BoxDecoration
    (
      borderRadius: BorderRadius.circular(10),
      color: App_Colors.primary,
    ),
  );

  buildTodoInfo() => Expanded
  (
        child: Column
        (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
          [
            Spacer(),

            Text
            (
              item.title,
              maxLines: 1,
              style:
              App_Style.bottomSheetTitle.copyWith(color: App_Colors.primary),
            ),

            Spacer(),

            Text
            (
              item.description,
              style: App_Style.bodyTextStyle,
            ),

            Spacer(),
          ],
        ),
      );

  buildTodoState() => Container
  (
    decoration: BoxDecoration
    (
      color: App_Colors.primary,
      borderRadius: BorderRadius.circular(16),
    ),
    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
    child: Icon(Icons.done, color: Colors.white, size: 35,),
  );
}
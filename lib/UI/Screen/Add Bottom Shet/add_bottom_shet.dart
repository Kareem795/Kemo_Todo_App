import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_todo/Model/todo_dm.dart';
import 'package:project_todo/UI/Utils/app_style.dart';
import 'package:project_todo/UI/Utils/data_time_extension.dart';

class Add_Bottom_sheet extends StatefulWidget 
{
  const Add_Bottom_sheet({super.key});

  @override
  State<Add_Bottom_sheet> createState() => _Add_Bottom_sheetState();

  static void show(BuildContext context) 
  {
    showModalBottomSheet
    (
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding
      (
        padding: MediaQuery.of(context).viewInsets,
        child: const Add_Bottom_sheet(),
      )
    );
  }
}

class _Add_Bottom_sheetState extends State<Add_Bottom_sheet> 
{
  DateTime selectedDate = DateTime.now();
  TextEditingController titleControler = TextEditingController();
  TextEditingController descriptionControler = TextEditingController();
  @override
  Widget build(BuildContext context) 
  {

    return Container
    (
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.all(16),
      child: Column
      (
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: 
        [
          const Text
          (
            "add new task",
            textAlign: TextAlign.center,
            style: App_Style.bottomSheetTitle,
          ),

          const SizedBox(height: 12,),

          TextField
          (
            decoration: const InputDecoration(hintText: "Enter task title"),
            controller: titleControler,
          ),

          const SizedBox(height: 12,),
          
          TextField
          (
            decoration: const InputDecoration(hintText: "Enter task description"),
            controller: descriptionControler,
          ),

          const SizedBox(height: 12,),

          const Text
          (
            "selected data",
            style: App_Style.bottomSheetTitle,
          ),

          const SizedBox(height: 12,),

          InkWell
          (
            onTap: () 
            {
              showMyDatePidker();
            },
            child: Text
            (
              selectedDate.toformattedDate,
              style: App_Style.normalGreyTextStyle,
              textAlign: TextAlign.center,
            )
          ),

          const Spacer(),

          ElevatedButton
          (
            onPressed: ()
            {
              addTodoFireStore();
            }, 
            child: const Text("Add")
          )
        ],
      ),
    );
  }

  void showMyDatePidker() async 
  {
    selectedDate = await showDatePicker
    (
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365))
    )
    ?? selectedDate;

    setState(() {});

  }

  void addTodoFireStore() 
  {
    CollectionReference todoCollection = FirebaseFirestore.instance.collection(Todo_DM.collection_name);
    DocumentReference doc = todoCollection.doc();
    Todo_DM todo_dm = Todo_DM
    (
      id: doc.id, 
      title: titleControler.text, 
      date: selectedDate, 
      description: descriptionControler.text, 
      isDone: false
    );

    doc.set(todo_dm.to_json()).
    then
    (
      (_)
      {
        // this callback is called when future is completed
      }
    ).onError
    (
      (error, stackTrace) 
      {
        // this callback is called when the throw exception
      },
    ).timeout
    (
      Duration(milliseconds: 500),
      onTimeout: () 
      {
        // this callback is called after duration you have in frist arguments
        Navigator.pop(context);
      },
    );
  }
}

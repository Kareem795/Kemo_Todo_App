import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:project_todo/Model/todo_dm.dart';
import 'package:project_todo/Model/user_dm.dart';
import 'package:project_todo/UI/Screen/Home/Tabs/List/todo.dart';
import 'package:project_todo/UI/Utils/app_color.dart';
import 'package:project_todo/UI/Utils/data_time_extension.dart';
import 'package:project_todo/ui/utils/App_Style.dart';

class List_Tab extends StatefulWidget {
  const List_Tab({super.key});

  @override
  State<List_Tab> createState() => _List_TabState();
}

class _List_TabState extends State<List_Tab> {
  DateTime selecedCalenderDate = DateTime.now();
  List<Todo_DM> todosList = [];

  @override
  Widget build(BuildContext context) {
    // Retrieve todos when the widget builds
    getTodosListFromFireStore();
    return Column(
      children: [
        buildCalender(),
        Expanded(
          flex: 75,
          child: ListView.builder(
            itemCount: todosList.length,
            itemBuilder: (context, index) {
              return Todo(item: todosList[index]);
            },
          ),
        )
      ],
    );
  }

  Future<void> getTodosListFromFireStore() async {
    // Check if currentUser is not null
    if (User_DM.currentUser == null) {
      // Handle the error, for example, by showing a message or redirecting
      // return early if the user is not logged in or user data is not loaded
      print("User is not logged in or user data is not available.");
      return;
    }

    CollectionReference todoCollection = FirebaseFirestore.instance
        .collection(User_DM.collectionName)
        .doc(User_DM.currentUser!.id)
        .collection(Todo_DM.collection_name);

    QuerySnapshot querySnapshot = await todoCollection.get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;

    // Map the documents to the Todo_DM objects
    todosList = documents.map((doc) {
      Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
      return Todo_DM.fromJson(json);
    }).toList();

    // Filter the todos based on the selected date
    todosList = todosList
        .where((todo) =>
            todo.date.year == selecedCalenderDate.year &&
            todo.date.month == selecedCalenderDate.month &&
            todo.date.day == selecedCalenderDate.day)
        .toList();

    // Update the UI
    setState(() {});
  }

  buildCalender() {
    return Expanded(
      flex: 25,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: App_Colors.primary,
                ),
              ),
              Expanded(
                child: Container(
                  color: App_Colors.bgColor,
                ),
              ),
            ],
          ),
          EasyInfiniteDateTimeLine(
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            focusDate: selecedCalenderDate,
            lastDate: DateTime.now().add(const Duration(days: 365)),
            onDateChange: (selectedDate) {
              setState(() {
                selecedCalenderDate = selectedDate;
                getTodosListFromFireStore(); // Refresh the list when date changes
              });
            },
            itemBuilder: (context, date, inSelected, onDateTapped) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selecedCalenderDate = date;
                    getTodosListFromFireStore(); // Refresh the list when date changes
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: App_Colors.White,
                      borderRadius: BorderRadius.circular(22)),
                  child: Column(
                    children: [
                      const Spacer(),
                      Text(
                        date.dayName,
                        style: inSelected
                            ? App_Style.selectedCalenderDayStyle
                            : App_Style.unselectedCalenderDayStyle,
                      ),
                      const Spacer(),
                      Text(
                        date.day.toString(),
                        style: inSelected
                            ? App_Style.selectedCalenderDayStyle
                            : App_Style.unselectedCalenderDayStyle,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

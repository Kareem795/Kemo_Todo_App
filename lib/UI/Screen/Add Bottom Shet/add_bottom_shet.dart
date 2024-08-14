import 'package:flutter/material.dart';
import 'package:project_todo/UI/Utils/data_time_extension.dart';
import 'package:project_todo/ui/utils/assets_Style.dart';

class Add_Bottom_sheet extends StatefulWidget {
  Add_Bottom_sheet({super.key});

  @override
  State<Add_Bottom_sheet> createState() => _Add_Bottom_sheetState();

  static void Show(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Add_Bottom_sheet(),
            ));
  }
}

class _Add_Bottom_sheetState extends State<Add_Bottom_sheet> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "add new task",
            textAlign: TextAlign.center,
            style: Assets_Style.bottomSheetTitle,
          ),
          const SizedBox(
            height: 12,
          ),
          const TextField(
            decoration: InputDecoration(hintText: "Enter task title"),
          ),
          const SizedBox(
            height: 12,
          ),
          const TextField(
            decoration: InputDecoration(hintText: "Enter task description"),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "selected data",
            style: Assets_Style.bottomSheetTitle,
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                showMyDatePidker();
              },
              child: Text(
                selectedDate.toformattedDate,
                style: Assets_Style.normalGreyTextStyle,
                textAlign: TextAlign.center,
              )),
          const Spacer(),
          ElevatedButton(onPressed: () {}, child: const Text("Add"))
        ],
      ),
    );
  }

  void showMyDatePidker() async {
    selectedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365))) ??
        selectedDate;

    setState(() {});
  }
}

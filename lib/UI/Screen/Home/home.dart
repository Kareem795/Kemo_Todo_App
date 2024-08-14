import 'package:flutter/material.dart';
import 'package:project_todo/UI/Screen/Add%20Bottom%20Shet/add_bottom_shet.dart';
import 'package:project_todo/UI/Screen/Tabs/list_tabs.dart';
import 'package:project_todo/UI/Screen/Tabs/settings_tabs.dart';
import 'package:project_todo/ui/utils/assets_color.dart';

class HomeScreen extends StatefulWidget {
  static const String routeNamed = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [const List_Tab(), const Settings_Tab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),
        elevation: 0,
      ),
      body: tabs[currentIndex],
      floatingActionButton: buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildbottomNavigationBar(),
    );
  }

  Widget buildbottomNavigationBar() => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: currentIndex,
            onTap: (tappedIndex) {
              currentIndex = tappedIndex;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: "list"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "settings"),
            ]),
      );

  buildFab() => FloatingActionButton(
        onPressed: () {
          Add_Bottom_sheet.Show(context);
        },
        backgroundColor: App_Colors.primary,
        shape: const StadiumBorder(
            side: BorderSide(color: App_Colors.White, width: 3)),
        child: const Icon(Icons.add),
      );
}

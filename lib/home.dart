import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/tabs/edit_screen.dart';
import 'package:todo_app/tabs/settings.dart';
import 'package:todo_app/tabs/tasks.dart';
import 'package:todo_app/task_bottom_sheet.dart';

import 'my_theme.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: themeProvider.mode == ThemeMode.light
          ? MyThemeData.scafoldColor
          : MyThemeData.darkColor,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "ToDo App",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskBottomSheet(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Colors.transparent,
            width: 4,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(

        color: themeProvider.mode == ThemeMode.light
            ? MyThemeData.whiteColor
            : Colors.black12,

        notchMargin: 8,
        padding: EdgeInsets.zero,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,

            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ]),
      ),
      body: tabs[selectedIndex],
    );
  }

  String x="x>6 : true";
  List<Widget> tabs = [TasksTab(), SettingsTab(), EditScreen()];
}

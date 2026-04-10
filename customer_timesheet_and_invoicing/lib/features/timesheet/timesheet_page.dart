import 'package:customer_timesheet_and_invoicing/data/services/task_creation_service.dart';
import 'package:flutter/material.dart';

class Timesheet extends StatefulWidget {
  const Timesheet ({super.key});

  State<Timesheet> createState() => _TimesheetState();
}

class _TimesheetState extends State<Timesheet> {
  bool addTask = false;

  final taskServices = TaskCreationService();
  final TextEditingController _taskListController = TextEditingController();
  final TextEditingController _clientController = TextEditingController();

  List<Map<String, dynamic>> taskList = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    final result = await taskServices.getTaskItems();
    setState(() {
      taskList = result;
    });
  }

  Future<void> addTasks(String task) async {
    await taskServices.createTaskItems({
      'task': task
    });
    await loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
      SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addTask = true;
                      });
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColorLight,
                      foregroundColor: Theme.of(context).primaryColorDark,
                    ),
                    child: Text(
                      "New Task",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                        fontWeight: Theme.of(context).textTheme.bodySmall?.fontWeight,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
        
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColorLight,
                      foregroundColor: Theme.of(context).primaryColorDark,
                    ),
                    child: Text(
                      "Generate Statement",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                        fontWeight: Theme.of(context).textTheme.bodySmall?.fontWeight,
                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                ],
              ), 
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: screenHeight * 0.8,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).highlightColor,
                            width: 1,
                          ),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 5,
                                bottom: 5,
                                right: 10
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1,
                                    color: Theme.of(context).highlightColor,
                                  )
                                ),
                                color: Theme.of(context).primaryColorDark
                              ),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Filters",
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
        
                                    }, 
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context).primaryColorLight,
                                      foregroundColor: Theme.of(context).primaryColorDark,
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.only(
                                        top: 2,
                                        bottom: 2,
                                        left: 10,
                                        right: 10
                                      )
                                    ),
                                    child: Text(
                                      "Clear",
                                      style: TextStyle(
                                        color: Theme.of(context).textTheme.bodySmall?.color,
                                        fontWeight: Theme.of(context).textTheme.bodySmall?.fontWeight,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FractionallySizedBox(
                              widthFactor: 0.9,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                  top: 5,
                                  bottom: 5
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 0.5,
                                      color: Theme.of(context).highlightColor,
                                    )
                                  )
                                ),
                                child: Text(
                                  "General",
                                  style: TextStyle(
                                    color: Theme.of(context).textTheme.bodySmall?.color,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                left: 30,
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  alignment: Alignment.centerLeft,
                                  foregroundColor: Colors.black.withValues(alpha: 1),
                                  overlayColor: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                child: Text(
                                  "Date",
                                  style: TextStyle(
                                    color: Theme.of(context).textTheme.bodySmall?.color,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                onPressed: () {
        
                                },
                              )
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                left: 30,
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  alignment: Alignment.centerLeft,
                                  foregroundColor: Colors.black.withValues(alpha: 1),
                                  overlayColor: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                child: Text(
                                  "Task",
                                  style: TextStyle(
                                    color: Theme.of(context).textTheme.bodySmall?.color,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                onPressed: () {
        
                                },
                              )
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                left: 30,
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  alignment: Alignment.centerLeft,
                                  foregroundColor: Colors.black.withValues(alpha: 1),
                                  overlayColor: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                child: Text(
                                  "Paid Invoices",
                                  style: TextStyle(
                                    color: Theme.of(context).textTheme.bodySmall?.color,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                onPressed: () {
        
                                },
                              )
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                left: 30,
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  alignment: Alignment.centerLeft,
                                  foregroundColor: Colors.black.withValues(alpha: 1),
                                  overlayColor: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                child: Text(
                                  "Purchase Order Numbers",
                                  style: TextStyle(
                                    color: Theme.of(context).textTheme.bodySmall?.color,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                onPressed: () {
        
                                },
                              )
                            ),
                            FractionallySizedBox(
                              widthFactor: 0.9,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                  top: 30,
                                  bottom: 5
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 0.5,
                                      color: Theme.of(context).highlightColor,
                                    )
                                  )
                                ),
                                child: Text(
                                  "Clients",
                                  style: TextStyle(
                                    color: Theme.of(context).textTheme.bodySmall?.color,
                                  ),
                                ),
                              ),
                            ),
                            SingleChildScrollView(
      
                            ),
                          ],
                        )
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: screenHeight * 0.8,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).highlightColor,
                            width: 1
                          ),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorDark,
                                border: Border(
                                  bottom: BorderSide(
                                    color: Theme.of(context).highlightColor,
                                  )
                                )
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 5,
                                        bottom: 5
                                      ),
                                      child: Text(
                                        "Task",
                                        style: TextStyle(
                                          color: Theme.of(context).textTheme.bodySmall?.color,
                                        ),
                                      )
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 5,
                                        bottom: 5
                                      ),
                                      child: Text(
                                        "Purchase Order Number",
                                        style: TextStyle(
                                          color: Theme.of(context).textTheme.bodySmall?.color,
                                        ),
                                      )
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 5,
                                        bottom: 5
                                      ),
                                      child: Text(
                                        "Client",
                                        style: TextStyle(
                                          color: Theme.of(context).textTheme.bodySmall?.color,
                                        ),
                                      )
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 5,
                                        bottom: 5
                                      ),
                                      child: Text(
                                        "Date",
                                        style: TextStyle(
                                          color: Theme.of(context).textTheme.bodySmall?.color,
                                        ),
                                      )
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 5,
                                        bottom: 5
                                      ),
                                      child: Text(
                                        "Hours",
                                        style: TextStyle(
                                          color: Theme.of(context).textTheme.bodySmall?.color,
                                        ),
                                      )
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 5,
                                        bottom: 5
                                      ),
                                      child: Text(
                                        "Paid",
                                        style: TextStyle(
                                          color: Theme.of(context).textTheme.bodySmall?.color,
                                        ),
                                      )
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      Visibility(
        visible: addTask,
        child: Positioned(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.8),
            ),
            padding: EdgeInsets.only(
              top: screenHeight * 0.15,
              bottom: screenHeight * 0.15,
              left: screenWidth * 0.35,
              right: screenWidth * 0.35,
            ),
            child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColorDark.withValues(alpha: 0.8), // Shadow color
                      spreadRadius: 3, // How much the shadow expands
                      blurRadius: 5, // Softness of the shadow
                      offset: Offset(0, 5), // Position changes (x, y)
                    ),
                  ],
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Theme.of(context).textTheme.bodySmall?.color,
                          ),
                          onPressed: () {
                            setState(() {
                              addTask = false;
                              _clientController.clear();
                              _taskListController.clear();
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 20
                          ),
                          child: Text(
                            "New Task",
                            style: TextStyle(
                              color: Theme.of(context).textTheme.bodySmall?.color,
                              fontSize: 26,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 20
                          ),
                          child: DropdownMenu(
                            label: Text(
                              "Task",
                              style: TextStyle(
                                color: Theme.of(context).textTheme.bodySmall?.color,
                              ),
                            ),
                            controller: _taskListController,
                            width: screenWidth * 0.25,
                            hintText: "Select a Task",
                            trailingIcon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: Theme.of(context).textTheme.bodySmall?.color,
                            ),
                            selectedTrailingIcon: Icon(
                              Icons.keyboard_arrow_up_sharp,
                              color: Theme.of(context).textTheme.bodySmall?.color,
                            ),
                            menuStyle: MenuStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).primaryColor
                              ),
                            ),
                            inputDecorationTheme: InputDecorationTheme(
                              filled: true,
                              fillColor: Theme.of(context).primaryColor,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).highlightColor,
                                  width: 1
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20)
                                )
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).highlightColor,
                                  width: 1
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20)
                                )
                              )
                            ),
                            textStyle: TextStyle(
                              color: Theme.of(context).textTheme.bodySmall?.color,
                            ),
                            dropdownMenuEntries: [
                              for (var task in taskList)
                                DropdownMenuEntry(
                                  label: task["task"],
                                  value: task,
                                  style: MenuItemButton.styleFrom(
                                    foregroundColor: Theme.of(context).highlightColor,
                                  ),
                                )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            right: 20
                          ),
                          child: IconButton(
                            onPressed: () {
                              addTasks(_taskListController.text);
                            },
                            icon: Icon(
                              Icons.add,
                              color: Theme.of(context).textTheme.bodySmall?.color,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 20
                          ),
                          child: DropdownMenu(
                            label: Text(
                              "Client",
                              style: TextStyle(
                                color: Theme.of(context).textTheme.bodySmall?.color,
                              ),
                            ),
                            controller: _clientController,
                            width: screenWidth * 0.25,
                            hintText: "Select a Client",
                            trailingIcon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: Theme.of(context).textTheme.bodySmall?.color,
                            ),
                            selectedTrailingIcon: Icon(
                              Icons.keyboard_arrow_up_sharp,
                              color: Theme.of(context).textTheme.bodySmall?.color,
                            ),
                            menuStyle: MenuStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).primaryColor
                              ),
                            ),
                            inputDecorationTheme: InputDecorationTheme(
                              filled: true,
                              fillColor: Theme.of(context).primaryColor,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).highlightColor,
                                  width: 1
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20)
                                )
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).highlightColor,
                                  width: 1
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20)
                                )
                              )
                            ),
                            textStyle: TextStyle(
                              color: Theme.of(context).textTheme.bodySmall?.color,
                            ),
                            dropdownMenuEntries: [
                              for (var task in taskList)
                                DropdownMenuEntry(
                                  label: task["task"],
                                  value: task,
                                  style: MenuItemButton.styleFrom(
                                    foregroundColor: Theme.of(context).highlightColor,
                                  ),
                                )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            right: 20
                          ),
                          child: IconButton(
                            onPressed: () {
                              addTasks(_taskListController.text);
                            },
                            icon: Icon(
                              Icons.add,
                              color: Theme.of(context).textTheme.bodySmall?.color,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
          ),
        ),
      )
      ]
    );
  }
}
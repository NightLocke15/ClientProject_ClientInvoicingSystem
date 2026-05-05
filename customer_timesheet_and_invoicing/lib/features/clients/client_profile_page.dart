import 'package:customer_timesheet_and_invoicing/core/text_input.dart';
import 'package:customer_timesheet_and_invoicing/data/services/client_creation_services.dart';
import 'package:customer_timesheet_and_invoicing/data/services/timesheet_task_creation_services.dart';
import 'package:customer_timesheet_and_invoicing/features/clients/components/client_task_list_items.dart';
import 'package:customer_timesheet_and_invoicing/features/timesheet/components/timesheet_task_item.dart';
import 'package:flutter/material.dart';

class ClientProfile extends StatefulWidget {
  final String clientID;

  const ClientProfile({super.key, required this.clientID});

  State<ClientProfile> createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> {
  final clientServices = ClientCreationServices();
  final timesheetTaskServices = TimesheetTaskCreationServices();

  bool editClient = false;
  bool deleteBool = false;
  bool editTask = false;

  int taskID = 0;

  Map<String, dynamic>? currentClient;
  List<Map<String, dynamic>> currentClientTaskList = [];

  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _taskListController = TextEditingController();
  final TextEditingController _clientController = TextEditingController();
  final TextEditingController _posController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _hoursController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadClient();
    getClientTaskList();
  }

  Future<void> loadClient() async {
    final result = await clientServices.getClient(widget.clientID);
    setState(() {
      currentClient = result;
     _notesController.text = result!['notes'] == null ? "" : result['notes'];
    });  
  }

  Future<void> updateClientNotes(String note) async {
    await clientServices.updateClient(widget.clientID, {
      'notes': note,
    });
    loadClient();
  }

  Future<void> getClientTaskList() async {
    final result = await timesheetTaskServices.getTimesheetTasks();
    setState(() {
      currentClientTaskList = List<Map<String, dynamic>>.from(result.where((item) {
        return item["client_fk"].contains(currentClient!["client_bus_name"]);
      }));
    });
    debugPrint(result.toString());
  }

  Future<void> editTimeTask(int id, String task, String pos, String client, String date, int hours) async {
    await timesheetTaskServices.updateTimesheetTask(id, {
      'task_fk': task,
      'pos_fk': pos,
      'client_fk': client,
      'date': date,
      'hours': hours,
    });
    await getClientTaskList();
  }

  Future<void> deleteTimeTask(int id) async {
    await timesheetTaskServices.deleteTimehseetTask(id);
    getClientTaskList();
  }

  Future<void> updatePaid(int id, String paid) async {
    await timesheetTaskServices.updateTimesheetTask(id, {
      'paid': paid,
    });
    await getClientTaskList();
  }

  @override
  void dispose() {
    _notesController.dispose();
    _taskListController.dispose();
    _clientController.dispose();
    _posController.dispose();
    _dateController.dispose();
    _hoursController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    void activateDelete(int id, bool delete) {
      setState(() {
        deleteBool = delete;
        taskID = id;
      });
    }
    
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              left: 50,
              right: 50
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                          ),
                          padding: EdgeInsets.only(
                            left: 50,
                            right: 50,
                            top: 20
                          ),
                          width: screenWidth * 0.45,
                          height: screenHeight * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Client ID: ",
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    currentClient == null ? "" : currentClient!['id'],
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Contact Person: ",
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    currentClient == null ? "" : currentClient!['client_contact_person'],
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Contact Number: ",
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    currentClient == null ? "" : currentClient!['client_contact_number'].toString(),
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Email: ",
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    currentClient == null ? "" : currentClient!['client_email'],
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "VAT Number: ",
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    currentClient == null ? "" : currentClient!['client_vatNumber'].toString(),
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Address: ",
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        currentClient == null ? "" : currentClient!['client_street_address'].toString(),
                                        style: TextStyle(
                                          color: Theme.of(context).textTheme.bodySmall?.color,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        currentClient == null ? "" : currentClient!['client_suburb'].toString(),
                                        style: TextStyle(
                                          color: Theme.of(context).textTheme.bodySmall?.color,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        currentClient == null ? "" : currentClient!['client_city'].toString(),
                                        style: TextStyle(
                                          color: Theme.of(context).textTheme.bodySmall?.color,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        currentClient == null ? "" : currentClient!['client_postal_code'].toString(),
                                        style: TextStyle(
                                          color: Theme.of(context).textTheme.bodySmall?.color,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                          ),
                          padding: EdgeInsets.only(
                            left: 50,
                            right: 50,
                            top: 20
                          ),
                          width: screenWidth * 0.45,
                          height: screenHeight * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Notes: ",
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 300,
                                child: TextField(
                                  controller: _notesController,
                                  expands: true,
                                  maxLines: null,
                                  minLines: null,
                                  style: TextStyle(
                                    color: Theme.of(context).textTheme.bodySmall?.color,
                                  ),
                                  textAlignVertical: TextAlignVertical.top,
                                  cursorColor: Theme.of(context).highlightColor,
                                  decoration: InputDecoration(
                                    fillColor: Theme.of(context).primaryColorLight,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(context).highlightColor,
                                        width: 1.0,
                                      )
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(context).highlightColor,
                                        width: 1.0,
                                      )
                                    ),
                                  ),
                                  onChanged: (e) {
                                    updateClientNotes(e);
                                  },                        
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).highlightColor,
                        width: 1
                      ),
                      color: Theme.of(context).primaryColor
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
                                color: Theme.of(context).highlightColor
                              )
                            ),
                            color: Theme.of(context).primaryColorDark
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: 8,
                                    top: 3,
                                    bottom: 3
                                  ),
                                  child: Text(
                                    "Task",
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: 8,
                                    top: 3,
                                    bottom: 3
                                  ),
                                  child: Text(
                                    "Purchase Order Number",
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: 8,
                                    top: 3,
                                    bottom: 3
                                  ),
                                  child: Text(
                                    "Date",
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: 8,
                                    top: 3,
                                    bottom: 3
                                  ),
                                  child: Text(
                                    "Hours",
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: 15,
                                    top: 3,
                                    bottom: 3
                                  ),
                                  child: Text(
                                    "Paid",
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodySmall?.color
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              for (var task in currentClientTaskList)
                                ClientTimeTaskListItem(
                                  id: task['id'], 
                                  task: task['task_fk'], 
                                  pos: task['pos_fk'], 
                                  client: task['client_fk'], 
                                  date: task['date'], 
                                  hours: task['hours'].toString(), 
                                  paid: task['paid'], 
                                  rowColor: Theme.of(context).primaryColor, 
                                  deleteFunc: activateDelete,
                                  paidFunc: updatePaid
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: deleteBool,
          child: Positioned(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.8),
              ),
              padding: EdgeInsets.only(
                top: screenHeight * 0.35,
                bottom: screenHeight * 0.35,
                left: screenWidth * 0.33,
                right: screenWidth * 0.33,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: const Color.fromARGB(255, 216, 19, 5),
                    width: 2
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColorDark.withValues(alpha: 0.8),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 5) 
                    )
                  ]
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 50
                      ),
                      child: Text(
                        "Are you sure you want to delete this Task?",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodySmall?.color,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 35,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            deleteTimeTask(taskID);
                            deleteBool = false;
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 218, 29, 15),
                            foregroundColor: Theme.of(context).primaryColorDark,
                            elevation: 5,
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 30
                            )
                          ),
                          child: Text(
                            "Delete",
                            style: TextStyle(
                              color: Theme.of(context).textTheme.bodySmall?.color,
                              fontWeight: Theme.of(context).textTheme.bodySmall?.fontWeight,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              deleteBool = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColorLight,
                            foregroundColor: Theme.of(context).primaryColorDark,
                            elevation: 5,
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 30
                            )
                          ),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Theme.of(context).textTheme.bodySmall?.color,
                              fontWeight: Theme.of(context).textTheme.bodySmall?.fontWeight,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ),
        ),
      ]
    );
  }
}
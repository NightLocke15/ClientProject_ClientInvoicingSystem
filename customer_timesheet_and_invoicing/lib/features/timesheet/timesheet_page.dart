import 'package:flutter/material.dart';

class Timesheet extends StatelessWidget {
  const Timesheet ({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
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
    );
  }
}
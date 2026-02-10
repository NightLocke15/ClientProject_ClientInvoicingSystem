import 'package:flutter/material.dart';

class Timesheet extends StatelessWidget {
  const Timesheet ({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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
              SizedBox(width: 60,),
            ],
          ), 
        ],
      ),
    );
  }
}
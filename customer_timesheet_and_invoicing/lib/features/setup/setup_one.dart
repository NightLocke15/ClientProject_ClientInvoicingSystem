import 'package:customer_timesheet_and_invoicing/core/text_input.dart';
import 'package:flutter/material.dart';

class SetupOne extends StatelessWidget {
  final VoidCallback onPressed;
  final Function(bool?) onChecked;
  final bool vatRegistered;

  const SetupOne({
    super.key, 
    required this.onPressed, 
    required this.onChecked, 
    required this.vatRegistered,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 500,
            child: Text(
              "Business Details",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodySmall?.color,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextInput(labelName: "Name *", hintText: "Name...",),
          SizedBox(
            height: 10,
          ),
          CustomTextInput(labelName: "Bussiness Name", hintText: "Business Name..."),
          SizedBox(
            height: 10,
          ),
          CustomTextInput(labelName: "Phone Number *", hintText: "Phone Number..."),
          SizedBox(
            height: 10,
          ),
          CustomTextInput(labelName: "Email *", hintText: "Email..."),
          SizedBox(
            height: 10,
          ),
          CustomTextInput(labelName: "Most Recent Invoice Number *", hintText: "Invoice Number..."),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 530,
            child: CheckboxListTile(
              hoverColor: Colors.transparent,
              activeColor: Colors.transparent,
              side: WidgetStateBorderSide.resolveWith(
                (Set<WidgetState> states) {
                  if(states.contains(WidgetState.selected)) {
                    return const BorderSide(
                      color: Color.fromRGBO(103, 103, 103, 1),
                      width: 0.8,
                    );
                  }
                  return const BorderSide(
                    color: Color.fromRGBO(103, 103, 103, 1),
                    width: 0.8,
                  );
                }
              ),
              checkboxShape: CircleBorder(),
              checkboxScaleFactor: 1.5,
              value: vatRegistered,
              onChanged: onChecked,
              title: Text(
                "Are you VAT Registered?",
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              )
            ),
          ),
          if(vatRegistered) SizedBox(
            height: 10,
          ),
          if(vatRegistered) CustomTextInput(labelName: "VAT Number *", hintText: "VAT Number..."),
          if(vatRegistered) SizedBox(
            height: 10,
          ),
          if(vatRegistered) CustomTextInput(labelName: "Most Recent Invoice Number *", hintText: "Invoice Number..."),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 500,
            child: Container(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColorLight,
                  foregroundColor: Theme.of(context).primaryColorDark,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30
                  )
                ),
                onPressed: onPressed, 
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                    fontSize: 18
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }  
}
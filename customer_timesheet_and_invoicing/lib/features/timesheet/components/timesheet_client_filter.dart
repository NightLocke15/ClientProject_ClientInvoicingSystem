import 'package:flutter/material.dart';

class TimesheetClientFilter extends StatelessWidget {
  final String clientName;

  const TimesheetClientFilter({super.key, required this.clientName});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          clientName,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodySmall?.color,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        onPressed: () {

        },
      )
    );
  }
}
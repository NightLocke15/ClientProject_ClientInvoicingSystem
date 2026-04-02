class TimesheetTask {
  final int? id;
  final String taskFK;
  final String posFK;
  final String clientFK;
  final String date;
  final String startTime;
  final String endTime;
  final String paid;

  TimesheetTask({
    this.id,
    required this.taskFK,
    required this.posFK,
    required this.clientFK,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.paid,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task_fk': taskFK,
      'pos_fk': posFK,
      'client_fk': clientFK,
      'date': date,
      'start_time': startTime,
      'end_time': endTime,
      'paid': paid,
    };
  }

  factory TimesheetTask.fromMap(Map<String, dynamic> map) {
    return TimesheetTask(
      id: map['id'],
      taskFK: map['task_fk'],
      posFK: map['pos_fk'],
      clientFK: map['client_fk'],
      date: map['date'],
      startTime: map['start_time'],
      endTime: map['end_time'],
      paid: map['paid'],
    );
  }
}
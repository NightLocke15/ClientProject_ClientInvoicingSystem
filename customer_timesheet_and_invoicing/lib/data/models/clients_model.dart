class Client {
  final String id;
  final String clientBusName;
  final String clientContactPerson;
  final int clientContactNumber;
  final String clientEmail;
  final int clientVatNumber;
  final String notes;

  Client({
    required this.id,
    required this.clientBusName,
    required this.clientContactPerson,
    required this.clientContactNumber,
    required this.clientEmail,
    required this.clientVatNumber,
    required this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'client_bus_name': clientBusName,
      'client_contact_person': clientContactPerson,
      'client_contact_number': clientContactNumber,
      'client_email': clientEmail,
      'client_vatNumber': clientVatNumber,
      'notes': notes
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['id'],
      clientBusName: map['client_bus_name'],
      clientContactPerson: map['client_contact_person'],
      clientContactNumber: map['client_contact_number'],
      clientEmail: map['client_email'],
      clientVatNumber: map['client_vatNumber'],
      notes: map['notes']
    );
  }
}
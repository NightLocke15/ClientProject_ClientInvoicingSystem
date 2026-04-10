import 'package:customer_timesheet_and_invoicing/data/services/client_creation_services.dart';
import 'package:flutter/material.dart';

class ClientProfile extends StatefulWidget {
  final String clientID;

  const ClientProfile({super.key, required this.clientID});

  State<ClientProfile> createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> {
  final clientServices = ClientCreationServices();

  Map<String, dynamic>? currentClient;

  @override
  void initState() {
    super.initState();
    loadClient();
  }

  Future<void> loadClient() async {
    final result = await clientServices.getClient(widget.clientID);
    setState(() {
      currentClient = result;
    });  
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: [
          SizedBox(height: 60,),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
            ),
            padding: EdgeInsets.only(
              left: 100,
              right: 100,
              top: 50
            ),
            width: screenWidth * 0.9,
            height: screenHeight * 0.4,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          right: 400
                        ),
                        child: Row(
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
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          right: 400
                        ),
                        child: Row(
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
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          right: 400
                        ),
                        child: Row(
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
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          right: 400
                        ),
                        child: Row(
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
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          right: 400
                        ),
                        child: Column(
                          children: [
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
                            SizedBox(height: 20,),
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
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          right: 400
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
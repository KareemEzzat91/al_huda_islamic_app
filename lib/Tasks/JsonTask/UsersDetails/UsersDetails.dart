import 'package:flutter/material.dart';
import '../UsersModel/Usersmodel.dart';

class Usersdetails extends StatelessWidget {
  final UsersModel item;

  const Usersdetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.username ?? "User Details"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Image (placeholder for now)
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    item.username?.substring(0, 1).toUpperCase() ?? 'U',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // User Details Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name ?? "N/A",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Email: ${item.email ?? "N/A"}",
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Phone: ${item.phone ?? "N/A"}",
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Website: ${item.website ?? "N/A"}",
                        style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                      ),
                      SizedBox(height: 16),

                      // Address Section
                      if (item.address != null) ...[
                        Text(
                          "Address:",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "${item.address!.street ?? "N/A"}, ${item.address!.city ?? "N/A"}",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                      SizedBox(height: 16),

                      // Company Section
                      if (item.company != null) ...[
                        Text(
                          "Company:",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          item.company!.name ?? "N/A",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

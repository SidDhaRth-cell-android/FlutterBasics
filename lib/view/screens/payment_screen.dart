import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Starbuck's orders",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              // Price Container
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[50],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton<String>(
                      value: 'USD',
                      onChanged: (String? newValue) {},
                      items: <String>['USD', 'EUR', 'GBP']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                            hintText: "Amount", prefixText: "\$",
                        border: InputBorder.none),
                      ),
                    )
                    /*Text(
                      "23.1",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),*/
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Order Details
              _buildOrderDetailRow(Icons.location_on_outlined, 'Address',
                  'New Yord Center Starbuck'),
              _buildOrderDetailRow(Icons.payment, 'Payment ID', 'SB90111221'),
              _buildOrderDetailRow(
                  Icons.check_circle_outline, 'Status', 'Unpaid',
                  statusColor: Colors.red),
              SizedBox(height: 20),
              Text('Notes'),
              SizedBox(height: 10),
              TextField(
                maxLines: 3, // Allow multiple lines for notes
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter any special instructions',
                ),
              ),
              SizedBox(height: 30),
              // Confirm Payment Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'CONFIRM PAYMENT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to create each order detail row
  Widget _buildOrderDetailRow(IconData icon, String title, String value,
      {Color statusColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(value, style: TextStyle(color: statusColor)),
            ],
          ),
        ],
      ),
    );
  }
}

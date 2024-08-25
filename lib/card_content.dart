import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final String name;
  final String date;

  const CardContent({
    super.key,
    required this.name,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
              fontSize: screenWidth * 0.05, // Adjust font size based on screen width
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.01), // Adjust spacing based on screen height
          Text(
            date,
            style: TextStyle(
              color: Colors.grey,
              fontSize: screenWidth * 0.04, // Adjust font size based on screen width
            ),
          ),
          const Spacer(),
          Row(
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF162A49),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.04, // Adjust font size based on screen width
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.015,
                    horizontal: screenWidth * 0.05,
                  ),
                ),
                onPressed: () {},
                child: const Text('Reserve',style: TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
              Text(
                '41.00 \$',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.05, // Adjust font size based on screen width
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calls'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search icon press
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the dial pad buttons in a grid
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              padding: EdgeInsets.all(16.0),
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 18.0,
              children: List.generate(10, (index) {
                if (index == 9) {
                  // Button for '0'
                  return DialButton(
                    text: '0',
                    onPressed: () => _onDialButtonPressed(context, '0'),
                  );
                } else {
                  // Buttons for digits 1 to 9
                  return DialButton(
                    text: (index + 1).toString(),
                    onPressed: () =>
                        _onDialButtonPressed(context, (index + 1).toString()),
                  );
                }
              }),
            ),
            // Button to make a call
            DialButton(
              text: 'Call',
              onPressed: () => _makeCall(context),
              backgroundColor: Colors.green, // Change color for call button
            ),
          ],
        ),
      ),
    );
  }

  void _onDialButtonPressed(BuildContext context, String number) {
    // Handle dial pad button press
    print('Dialing number: $number');
  }

  void _makeCall(BuildContext context) {
    // Handle call button press
    print('Making call...');
  }
}

class DialButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const DialButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: backgroundColor,
      textColor: Colors.black,
      padding: EdgeInsets.all(24.0),
      shape: CircleBorder(),
      child: Text(
        text,
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

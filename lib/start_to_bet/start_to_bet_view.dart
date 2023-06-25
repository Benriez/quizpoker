import 'package:flutter/material.dart';

class StartToBetPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Popup Title'),
      content: Text('This is the content of the popup.'),
      actions: [
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
    );
  }
}

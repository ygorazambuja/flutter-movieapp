import 'package:flutter/material.dart';

class SearchFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: Text(
        'Search',
        style: TextStyle(color: Colors.black87),
      ),
      icon: Icon(
        Icons.search,
        color: Colors.black87,
      ),
      backgroundColor: Colors.yellowAccent,
      onPressed: () {

      },
    );
  }
}

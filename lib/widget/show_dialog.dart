import 'package:flutter/material.dart';

AlertDialog ShowDialog() {
  int? _selectedValue = 1;
  return AlertDialog(
    title: const Text("Search Engine"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RadioListTile(
          value: 1,
          groupValue: _selectedValue,
          title: const Text("Google"),
          onChanged: (value) {
            _selectedValue = value;
          },
        ),

        RadioListTile(
          value: 2,
          groupValue: _selectedValue,
          onChanged: (value) {
            _selectedValue = value;
          },
          title: const Text("Bing"),
        ),

        RadioListTile(
            value: 3,
            groupValue: _selectedValue,
            onChanged: (value) {
              _selectedValue = value;
            },
            title: const Text("Yahoo"),
        ),

        RadioListTile(
            value: 4,
            groupValue: _selectedValue,
            onChanged: (value) {
              _selectedValue = value;
            },
            title: const Text("DuckDuckGo"),
        ),

      ],
    ),
  );
}

import 'package:flutter/material.dart';

LinearGradient getGradient(int index) {
  switch (index % 6) { // 6 different gradients (adjust as needed)
    case 0:
      return LinearGradient(colors: [Colors.lightBlueAccent, Colors.white],
      begin: Alignment.topCenter, // Start at top-left
      end: Alignment.bottomCenter, // End at bottom-right
      );
    case 1:
      return LinearGradient(colors: [Colors.pinkAccent, Colors.white],
      begin: Alignment.topCenter, // Start at top-left
      end: Alignment.bottomCenter, // End at bottom-right
      );
    case 2:
      return LinearGradient(colors: [Colors.purpleAccent, Colors.white],
      begin: Alignment.topCenter, // Start at top-left
      end: Alignment.bottomCenter, // End at bottom-right
      );
    case 3:
      return LinearGradient(colors: [Colors.greenAccent, Colors.white],
      begin: Alignment.topCenter, // Start at top-left
      end: Alignment.bottomCenter, // End at bottom-right
      );
    case 4:
      return LinearGradient(colors: [Colors.amberAccent, Colors.white],
      begin: Alignment.topCenter, // Start at top-left
      end: Alignment.bottomCenter, // End at bottom-right
      );
    case 5:
      return LinearGradient(colors: [Colors.deepOrangeAccent, Colors.white],
      begin: Alignment.topCenter, // Start at top-left
      end: Alignment.bottomCenter, // End at bottom-right
      );
    case 6:
      return LinearGradient(colors: [Colors.lightGreenAccent, Colors.white],
      begin: Alignment.topCenter, // Start at top-left
      end: Alignment.bottomCenter, // End at bottom-right
      );
    default:
      return LinearGradient(colors: [Colors.grey, Colors.white],
      begin: Alignment.topCenter, // Start at top-left
      end: Alignment.bottomRight, // End at bottom-right
      );
  }
}

import 'package:flutter/material.dart';

class AppConstants {
  static const String searchHint = "what do you search for?";
  static const String baseUrl = "https://newsapi.org";

  static const List<LinearGradient> onboardingGradients = [
    LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(8, 66, 80, 0),
        Color(0xFF084250),
      ],
      stops: [0.0, 1.0],
    ),
    LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(133, 33, 14, 0),
        Color(0xFF85210E),
      ],
      stops: [0.0, 1.0],
    ),
    LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(76, 36, 113, 0),
        Color(0xFF4C2471),
      ],
      stops: [0.0, 1.0],
    ),
    LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(96, 19, 33, 0),
        Color(0xFF601321),
      ],
      stops: [0.0, 1.0],
    ),
    LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(42, 44, 48, 0),
        Color(0xFF2A2C30),
      ],
      stops: [0.0, 1.0],
    ),
  ];
}

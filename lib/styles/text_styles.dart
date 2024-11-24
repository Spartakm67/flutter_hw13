import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    color: Colors.indigo,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        offset: Offset(3.0, 3.0),
        blurRadius: 5.0,
        color: Colors.black26,
      ),
    ],
  );

  static final ButtonStyle textButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.indigo,
    backgroundColor: Colors.white70,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    textStyle: TextStyles.buttonText,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  static const TextStyle defaultText = TextStyle(
    fontSize: 20,
    color: Colors.blueAccent,
    fontStyle: FontStyle.italic,
  );

  static const TextStyle greetingsText = TextStyle(
    fontSize: 30,
    color: Colors.redAccent,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle userText = TextStyle(
    fontSize: 14,
    color: Colors.blueAccent,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
  );

  static Text styledText(String text, TextStyle style) {
    return Text(
      text,
      style: style,
      softWrap: true,
      overflow: TextOverflow.visible,
    );
  }
}

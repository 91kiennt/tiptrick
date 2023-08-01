import 'package:flutter/material.dart';

class BtnModalCommon {
  static Widget btnYes(String name, VoidCallback onPressed) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          primary: Colors.blueAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
      child: DefaultTextStyle(
          style: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          child: Text(name)),
      onPressed: onPressed,
    );
  }

  static Widget btnNo(String name, VoidCallback onPressed) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Colors.grey,
          primary: Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
      child: DefaultTextStyle(
          style: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          child: Text(name)),
      onPressed: onPressed,
    );
  }

  static List<Widget> btnModalYesNo(
      String nameNo, VoidCallback fnNo, String nameYes, VoidCallback fnYes) {
    return <Widget>[
      Expanded(
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          child: btnNo(nameNo, fnNo),
        ),
      ),
      const SizedBox(width: 24),
      Expanded(
        child: Container(
          padding: const EdgeInsets.only(right: 16),
          child: btnYes(nameYes, fnYes),
        ),
      ),
    ];
  }
}

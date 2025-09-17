import 'package:flutter/material.dart';

void buildErrorBar(BuildContext context, String message, {Color? backgroundColor, int durationInSec = 3}){
   ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: backgroundColor,duration: Duration(seconds: durationInSec),)
  );
}
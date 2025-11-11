import 'package:flutter/material.dart';

Future<String?> showBottomSheetFilter(BuildContext context, {required Widget child}) async{
  return showModalBottomSheet<String>(
    context: context,
    backgroundColor: Colors.white,
    barrierColor: Colors.black.withAlpha(100),
    builder: (_) => child,
  );
}


import 'package:flutter/material.dart';
import 'package:note_crud/provider/provider_widget.dart';
import 'package:note_crud/utils/routes.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerateRoute,
        theme: ThemeData(fontFamily: 'Quicksand'),
      ),
    );
  }
}

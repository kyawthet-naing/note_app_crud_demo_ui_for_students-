import 'package:flutter/material.dart';
import 'package:note_crud/provider/note_provider.dart';
import 'package:provider/provider.dart';

class ProviderWidget extends StatelessWidget {
  final Widget child;
  const ProviderWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => NoteProvider()),
      ],
      child: child,
    );
  }
}

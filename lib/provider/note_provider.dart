import 'package:flutter/material.dart';
import 'package:note_crud/data/models/note_model.dart';

class NoteProvider extends ChangeNotifier {
  List<NoteModel> notes = [];

  int get notesLength => notes.length;

  changeNoteList(List<NoteModel> list) {
    notes = list;
    notifyListeners();
  }

  removeNote(NoteModel note) {
    notes.remove(note);
    notifyListeners();
  }

  add(NoteModel note) {
    notes.add(note);
    notifyListeners();
  }

  update(NoteModel note) {
    var idx = notes.indexWhere((e) => e.id == note.id);
    if (idx != -1) {
      notes[idx] = note;
    }
    notifyListeners();
  }
}

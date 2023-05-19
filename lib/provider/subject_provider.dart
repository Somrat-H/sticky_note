import 'package:flutter/material.dart';
import 'package:sticky_note/model/notes_model.dart';

class SubjectProvider extends ChangeNotifier{
  List<NotesModel> _notes = [];
  List<NotesModel> get notes => _notes;

  addSubjct(String subject){
    _notes.add(subject as NotesModel);
    notifyListeners();
  }
}
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sticky_note/model/notes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SubjectProvider extends ChangeNotifier {

  
  SharedPreferences? _prefs;

  List<NotesModel> _notes = [];
  List<NotesModel> get notes => _notes;
  

  //function for add subject
  addSubjct(String subject)async{
    _prefs  = await SharedPreferences.getInstance();
    _notes.add(NotesModel(subject: subject));
    saveData();
    notifyListeners();
   
  }
  
  //function for save data to local storage
  saveData()async{
     List<String> myList = _notes.map((e) => jsonEncode(e.toJson())).toList();
    _prefs?.setStringList('subject', myList);
     notifyListeners();
     debugPrint(myList.length.toString());
  }

  //function for fetch all data from local storage
  loadingData()async{
      _prefs  = await SharedPreferences.getInstance();
      List<String> ? spList = _prefs?.getStringList('subject');
      if(spList != null){
      _notes = spList.map((e) => NotesModel.fromJson(jsonDecode(e))).toList();
      }
      debugPrint(spList!.length.toString());
      notifyListeners(); 
  }

  //function for when home widget call in init this function and retrive all data
   initSharedPrefernce()async{
    _prefs = await SharedPreferences.getInstance();
    loadingData();
    notifyListeners();
  }

  //function for delete subject
  deleteSubject(int index){
    _notes.removeAt(index);
    saveData();
    notifyListeners();
  }
}
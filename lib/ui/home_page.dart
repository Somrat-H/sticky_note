import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_note/provider/subject_provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final subjectProvider = Provider.of<SubjectProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
        subjectProvider.addSubjct('biology');
      }),
      appBar: AppBar(
        title: Text('Sticky Notes'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: subjectProvider.notes.length,
            itemBuilder: (_, index){
            return Card(
              child: Text(subjectProvider.notes[index].subject),
            );
          }))
        ],
      ),
      
    );
  }
}
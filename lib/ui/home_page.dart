import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_note/provider/subject_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final subjectProvider = Provider.of<SubjectProvider>(context, listen: false);
    print('build');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
        subjectProvider.addSubjct('biology');
      }),
      appBar: AppBar(
        title:  Consumer<SubjectProvider>(
          builder: (context, value, child) => 
           Text('Sticky Notes ${subjectProvider.notes.length + 1}')),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: Consumer<SubjectProvider>(
            builder: (context, value, child) => 
            ListView.builder(
              itemCount: subjectProvider.notes.length,
              itemBuilder: (_, index){
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(subjectProvider.notes[index].subject, style: TextStyle(
                      fontSize: 25,
                    ),),
                    IconButton(
                      onPressed: (){
                          subjectProvider.deleteSubject(index);
                      },
                      icon: Icon(Icons.delete, size: 27,)),
                  ],
                ),
              );
            }),
          ))
        ],
      ),
      
    );
  }
}
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sticky Notes'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (_, index){
            return Card(

            );
          }))
        ],
      ),
    );
  }
}
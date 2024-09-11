import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple.shade900,
        onPressed: () {
          print("floating action button pressed");
        },
      ),
    );
  }

  ListView getNoteListView() {
    TextStyle? titleStyle = Theme.of(context).textTheme.headlineLarge;

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.5,
            child: ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.yellow.shade900,
                  child: Icon(Icons.keyboard_arrow_right)),
              title: Text('Dammy Title'),
              subtitle: Text("Dammy Date"),
              trailing: Icon(Icons.delete, color: Colors.red.shade900),
              onTap: () {
                print('List tile tapped');
              },
            ),
          );
        });
  }
}

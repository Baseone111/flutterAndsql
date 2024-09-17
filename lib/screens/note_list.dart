import 'package:flutter/material.dart';
import 'package:mobilenotes/screens/note_detail.dart';

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
      appBar: AppBar(
          title: Text(
            'Notes',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purple.shade900),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple.shade900,
        onPressed: () {
          toNavigateToNoteDetail('Add Note');
          print("floating action button pressed");
        },
        child: Icon(Icons.add, color: Colors.white),
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
                toNavigateToNoteDetail('Edit Note');
                print('List tile tapped');
              },
            ),
          );
        });
  }

  void toNavigateToNoteDetail(String title) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NoteDetails(appBarTitle: title)));
  }
}

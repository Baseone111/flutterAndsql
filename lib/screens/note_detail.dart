import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  const NoteDetails({Key? key}) : super(key: key);

  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  static var _priorities = ['High', 'Low'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleLarge;

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Note')),
      body: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // Dropdown for priorities
              ListTile(
                title: DropdownButton(
                  items: _priorities.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem));
                  }).toList(),
                  style: textStyle,
                  value: "Low",
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      print('User selected $valueSelectedByUser');
                    });
                  },
                ),
              ),
              // Title TextField
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: titleController,
                  onChanged: (value) {
                    print('Something changed in our title TextField');
                  },
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0))),
                ),
              ),
              // Description TextField
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: descriptionController,
                  onChanged: (value) {
                    print('Something changed in our description TextField');
                  },
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0))),
                ),
              ),
              // Buttons row
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      // Updated ElevatedButton style
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            print("Save button pressed");
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context)
                              .primaryColorDark, // New property for background color
                          foregroundColor:
                              Colors.white, // New property for text color
                        ),
                        child: const Text('Save'),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            print("Delete button pressed");
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context)
                              .primaryColorDark, // New property for background color
                          foregroundColor:
                              Colors.white, // New property for text color
                        ),
                        child: const Text('Delete'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

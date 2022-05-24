import 'package:flutter/material.dart';
import 'NewNote.dart';
import '../provider/Note_Provider.dart';

class NotesList extends StatefulWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  final _titleColor = const Color.fromARGB(255, 55, 48, 160);
  final _contentColor = const Color.fromARGB(255, 88, 80, 79);

  @override
  Widget build(BuildContext context) {
    List<NoteClass> notes = NoteClass.notes;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      children: List.generate(notes.length, (index) {//as loop
        return GestureDetector(
          onTap: () {
            //navigate to edit note,
            int noteId = notes[index].getId;
            Navigator.push(
              context,
              MaterialPageRoute(
                //passes note id to get its information for editing
                builder: (context) => CreateEditNote(noteId),
              ),
            );
          },
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                //the left color of the container, represents the note color
                left: BorderSide(
                  color: Color(notes[index].getColor),
                  width: 5,
                ),
              ),
              boxShadow: [
                BoxShadow(//to make shadow for the container
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 7, // blur radius
                  offset: const Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: const EdgeInsets.only(bottom: 15,),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [//information of the note
                  Text(
                    notes[index].getTitle,//note title
                    style: TextStyle(
                      color: _titleColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    //note content, gets the first 35 characters of the note content
                    notes[index].getContent.characters.string
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
import 'package:flutter/material.dart';
import '../core.dart';
import 'edit_noted.dart';

class DetailNotedView extends StatelessWidget {
  final Note note;

  const DetailNotedView({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/detailBg.png",
          height: 40.0,
          fit: BoxFit.fill,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: () {
                Get.to(EditNotedView(note: note));
              },
              child: Image.asset(
                "assets/edit.png",
                width: 35.0,
                height: 35.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: () async {
                bool confirm = false;
                await showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Row(
                        children: [
                          Image.asset(
                            "assets/delete.png",
                            width: 35.0,
                            height: 35.0,
                            fit: BoxFit.fill,
                          ),
                          const Text('Confirm'),
                        ],
                      ),
                      content: const SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('Are you sure you want to delete this file?'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[600],
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "No",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                          ),
                          onPressed: () {
                            confirm = true;
                            NoteLocalDB().deleteNote(note.id!);
                            Get.to(HomeView());
                          },
                          child: const Text(
                            "Yes",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );

                if (confirm) {
                  print("Confirmed!");
                }
              },
              child: Image.asset(
                "assets/delete.png",
                width: 35.0,
                height: 35.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Text(note.content),
        ),
      ),
    );
  }
}

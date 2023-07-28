import 'package:flutter/material.dart';

import '../core.dart';

class EditNotedView extends StatefulWidget {
  final Note note;

  const EditNotedView({super.key, required this.note});

  @override
  State<EditNotedView> createState() => _EditNotedViewState();
}

class _EditNotedViewState extends State<EditNotedView> {
  final formKey = GlobalKey<FormState>();

  TextEditingController? nameFileEditingController;
  TextEditingController? contentEditingController;

  @override
  void initState() {
    nameFileEditingController = TextEditingController();
    contentEditingController = TextEditingController();
    nameFileEditingController!.text = widget.note.title;
    contentEditingController!.text = widget.note.content;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameFileEditingController!.dispose();
    contentEditingController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/editBg.png",
          height: 40.0,
          fit: BoxFit.fill,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: () {
                Note note = widget.note.copyWith(
                  title: nameFileEditingController!.text,
                  content: contentEditingController!.text,
                );
                NoteLocalDB().updateNote(note);
                nameFileEditingController!.clear();
                contentEditingController!.clear();
                Get.to(HomeView());
              },
              child: Image.asset(
                "assets/save.png",
                width: 35.0,
                height: 35.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: nameFileEditingController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'enter name file',
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  // padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(),
                  ),
                  child: TextFormField(
                    controller: contentEditingController,
                    cursorColor: Colors.blue,
                    cursorWidth: 1,
                    maxLines: null,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

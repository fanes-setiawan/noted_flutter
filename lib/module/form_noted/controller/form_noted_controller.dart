import '../../../core.dart';
import 'package:flutter/material.dart';

class FormNotedController extends State<FormNotedView> {
  static late FormNotedController instance;
  late FormNotedView view;
  final formKey = GlobalKey<FormState>();
  late String formattedDate;
  late TextEditingController nameFiletEditingController =
      TextEditingController();
  late TextEditingController contenEditingController = TextEditingController();

  void save() {
    if (formKey.currentState!.validate()) {
      Note note = Note(
        title: nameFiletEditingController.text,
        content: contenEditingController.text,
        createdTime: DateTime.now(),
      );
      NoteLocalDB().insertNote(note);
      nameFiletEditingController.clear();
      contenEditingController.clear();
      Get.back();
    }
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}

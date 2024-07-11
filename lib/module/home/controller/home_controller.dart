import '../../../core.dart';
import 'package:flutter/material.dart';

class HomeController extends State<HomeView> {
  static late HomeController instance;
  late HomeView view;
  late Note note;
  List<Note> notes = [];
  bool isLoading = false;

  Future getAllNote() async {
    setState(() {
      isLoading = true;
    });
    notes = await NoteLocalDB().getAllNote();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    instance = this;
    getAllNote();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}

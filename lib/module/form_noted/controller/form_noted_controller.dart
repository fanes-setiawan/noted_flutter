import 'package:flutter/material.dart';
import 'package:noted_flutter/state_util.dart';
import '../view/form_noted_view.dart';

class FormNotedController extends State<FormNotedView> {
  static late FormNotedController instance;
  late FormNotedView view;

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

import 'package:flutter/material.dart';
import 'package:noted_flutter/core.dart';
import '../controller/form_noted_controller.dart';

class FormNotedView extends StatefulWidget {
  const FormNotedView({Key? key}) : super(key: key);

  Widget build(context, FormNotedController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/write.png",
          height: 40.0,
          fit: BoxFit.fill,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: () {
                controller.save();
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
        key: controller.formKey,
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
                    controller: controller.nameFiletEditingController,
                    maxLines: 1,
                    decoration:const InputDecoration(
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
            const     SizedBox(height: 20),
                Container(
                  // padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(),
                  ),
                  child: TextFormField(
                    controller: controller.contenEditingController,
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

  @override
  State<FormNotedView> createState() => FormNotedController();
}

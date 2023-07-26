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
              onTap: () async {
                bool confirm = false;
                await showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('name file'),
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              child: TextFormField(
                                maxLength: 20,
                                decoration: const InputDecoration(
                                  labelText: 'file',
                                  labelStyle: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  helperText: "enter your name file?",
                                ),
                                onChanged: (value) {},
                              ),
                            ),
                            ListBody(
                              children: <Widget>[
                                Text(
                                    'Are you sure you want to save this text?'),
                              ],
                            ),
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
                "assets/save.png",
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
          child: Column(
            children: [
              Container(
                // padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(),
                ),
                child: TextFormField(
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
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<FormNotedView> createState() => FormNotedController();
}

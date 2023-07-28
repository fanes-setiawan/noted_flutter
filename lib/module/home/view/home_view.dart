import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:noted_flutter/core.dart';
import 'package:noted_flutter/module/home/widget/cardContainer.dart';
import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      body: controller.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : controller.notes.isEmpty
              ? Center(
                  child: Text("Notes Empty"),
                )
              : CustomScrollView(
                  shrinkWrap: true,
                  slivers: <Widget>[
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      pinned: true,
                      snap: true,
                      floating: true,
                      expandedHeight: 100,
                      collapsedHeight: 60,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Image(
                          image: AssetImage('assets/appbarBg.png'),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              "New",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.notes.length,
                              itemBuilder: (context, index) {
                                DateTime createdTime =
                                    controller.notes[index].createdTime;
                                DateTime now = DateTime.now();

                                if (createdTime.isBefore(
                                    now.subtract(Duration(hours: 2)))) {
                                  return SizedBox.shrink();
                                } else {
                                  // Use SizedBox.shrink() to hide the item
                                  return CardContainer(
                                    index: index,
                                    note: controller.notes[index],
                                  );
                                }
                              },
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              "File",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(DetailNotedView(
                                  note: controller.notes[index]));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/file.png",
                                        width: 40.0,
                                        height: 40.0,
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                        width: 200,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              controller.notes[index].title,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                              ),
                                            ),
                                            Text(
                                              DateFormat('MMM dd yyyy hh:mm:ss')
                                                  .format(controller
                                                      .notes[index]
                                                      .createdTime),
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: controller.notes.length,
                      ),
                    ),
                  ],
                ),
      floatingActionButton: controller.notes.isEmpty
          ? IconButton(
              onPressed: () async {
                await Get.to(FormNotedView());
                controller.getAllNote();
              },
              icon: CircleAvatar(
                radius: 24,
                child: Image.asset(
                  "assets/add.png",
                  width: 30.0,
                  height: 30.0,
                  fit: BoxFit.fill,
                ),
              )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shake(duration: Duration(seconds: 5000)),
            )
          : IconButton(
              onPressed: () async {
                await Get.to(FormNotedView());
                controller.getAllNote();
              },
              icon: CircleAvatar(
                radius: 24,
                child: Image.asset(
                  "assets/add.png",
                  width: 30.0,
                  height: 30.0,
                  fit: BoxFit.fill,
                ),
              ),
            ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}

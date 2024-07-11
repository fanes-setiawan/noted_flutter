import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:noted_flutter/core.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      body: controller.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : controller.notes.isEmpty
              ?const  Center(
                  child: Text("Notes Empty"),
                )
              : CustomScrollView(
                  shrinkWrap: true,
                  slivers: <Widget>[
                   const  SliverAppBar(
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
                       const    Padding(
                            padding:  EdgeInsets.only(left: 10.0),
                            child: Text(
                              "New",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.notes.length,
                              itemBuilder: (context, index) {
                                DateTime createdTime =
                                    controller.notes[index].createdTime;
                                DateTime now = DateTime.now();

                                if (createdTime.isBefore(
                                    now.subtract(const  Duration(hours: 2)))) {
                                  return const SizedBox.shrink();
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
                        const   Divider(),
                      const     Padding(
                            padding:  EdgeInsets.only(left: 10.0),
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
                                  padding:const  EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/file.png",
                                        width: 40.0,
                                        height: 40.0,
                                        fit: BoxFit.fill,
                                      ),
                                  const     SizedBox(width: 5),
                                      SizedBox(
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
                                              style: const  TextStyle(
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
                                              style: const TextStyle(
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
                await Get.to(const FormNotedView());
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
                  .shake(duration: const Duration(seconds: 5000)),
            )
          : IconButton(
              onPressed: () async {
                await Get.to(const FormNotedView());
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

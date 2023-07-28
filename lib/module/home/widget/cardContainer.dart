import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noted_flutter/core.dart';
import 'package:noted_flutter/wedget/detail_noted.dart';

class CardContainer extends StatelessWidget {
  final int index;
  final Note note;

  const CardContainer({super.key, required this.index, required this.note});

  @override
  Widget build(BuildContext context) {
    final time = DateFormat('MMM d yyyy hh:mm').format(note.createdTime);
    return InkWell(
      onTap: () {
        Get.to(DetailNotedView(note: note));
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white24,
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        margin: EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              note.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              time,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

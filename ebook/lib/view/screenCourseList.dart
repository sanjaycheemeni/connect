import 'package:ebook/controller/CourseListController.dart';
import 'package:ebook/view/Widgets/CourseTile.dart';
import 'package:ebook/view/screenBook.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    var courses = courseList;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Course List',
              style: TextStyle(
                  color: Color.fromARGB(255, 207, 134, 134),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    // print(courses[index]["name"]);
                    return GestureDetector(
                        onTap: () {
                          Get.to(ImageListView(id: courses[index]['no']!));
                        },
                        child: CourseTile(title: courses[index]['name']!));
                  }),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tech4u/api/base_url.dart';
import 'package:tech4u/api/service/api_call.dart';
import 'package:tech4u/components/course_card.dart';
import 'package:tech4u/models/color_models.dart';

class UdemyDaily extends StatelessWidget {
  const UdemyDaily({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Get Udemy Courses for free Today !!!",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: appBarColor),
          ),
          const SizedBox(
            height: 20,
          ),

          // need to refractor this code , same as homescreen
          Expanded(
            child: FutureBuilder(
                future: fetchUdemy(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<Map<String, dynamic>> udemyCourses = snapshot.data!;
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: udemyCourses.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              childAspectRatio: 1,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemBuilder: (BuildContext context, int index) {
                        return CourseCard(
                            id: udemyCourses[index]['_id'],
                            org: udemyCourses[index]['org'],
                            imageUrl: udemyCourses[index]['coursePhoto'],
                            title: udemyCourses[index]['name'],
                            subtitle: udemyCourses[index]['desc']);
                      },
                    );
                  }
                }),
          )
        ],
      ),
    );
  }

  Future<dynamic> fetchUdemy() async {
    final res =
        await ApiCall(baseUrl: apiBaseUrl, route: "/users/udemy").fetchData();
    if (res != null) {
      final data = res['data'];
      if (data != null) {
        List<Map<String, dynamic>> udemyCourses = [];
        for (var courseData in data) {
          if (courseData is Map<String, dynamic>) {
            udemyCourses.add(courseData);
          }
        }

        return udemyCourses;
      } else {
        return res;
      }
    }
    return null;
  }
}

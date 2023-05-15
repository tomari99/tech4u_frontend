import 'package:flutter/material.dart';
import 'package:tech4u/api/base_url.dart';
import 'package:tech4u/api/service/api_call.dart';
import 'package:tech4u/models/color_models.dart';

class CourseDetail extends StatelessWidget {
  final String id;
  const CourseDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 150,
            backgroundColor: appBarColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notification_important_rounded))
            ],
            title: const Text(
              "Course Detail",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            expandedHeight: 200,
            flexibleSpace: FutureBuilder(
              future: fetchOne(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final course = snapshot.data!;
                  return FlexibleSpaceBar(
                    background: Image.network(
                      '$baseUrl/${course['coursePhoto']}',
                      fit: BoxFit.cover,
                    ),
                  );
                }
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: FutureBuilder(
                future: fetchOne(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final course = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(course['name']),
                        Text(course['org']),
                        Text(course['desc'])
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> fetchOne() async {
    final res = await ApiCall(baseUrl: apiBaseUrl, route: "/courses/", id: id)
        .fetchData();
    if (res != null) {
      final data = res['data'];
      return data;
    } else {
      return res;
    }
  }
}

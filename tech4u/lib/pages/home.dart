import 'package:flutter/material.dart';
import 'package:tech4u/api/base_url.dart';
import 'package:tech4u/api/models/course_model.dart';
import 'package:tech4u/api/service/api_call.dart';
import 'package:tech4u/components/auth/auth_dialog.dart';
import 'package:tech4u/components/course_card.dart';
import 'package:tech4u/components/my_clip_path.dart';
import 'package:tech4u/components/my_drawer.dart';
import 'package:tech4u/models/color_models.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

void _showAuthDialogBox(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AuthDialogBox(
        isSignup: false,
      );
    },
  );
}

class _HomeState extends State<Home> {
  Future<dynamic> _fetchData() async {
    final response =
        await ApiCall(baseUrl: apiBaseUrl, route: "/courses").fetchData();

    if (response != null) {
      final data = response['data'];
      if (data != null) {
        List<Map<String, dynamic>> courses = [];
        for (var courseData in data) {
          if (courseData is Map<String, dynamic>) {
            courses.add(courseData);
          }
        }

        return courses;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAuthDialogBox(
              context); // Show the AuthDialogBox when FAB is pressed
        },
        child: const Icon(
          Icons.login,
          color: Colors.black,
          size: 50,
        ), // You can customize the FAB icon to your preference
      ),
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          "Tech4U",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        elevation: 0,
      ),
      drawer: const Drawer(
        width: double.infinity,
        backgroundColor: secondaryColor,
        child: MyDrawer(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: MyClipPath(),
                child: Container(
                  color: appBarColor,
                  height: 400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Open-Source",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Free Resources",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 280,
                      decoration: const BoxDecoration(
                        // color: primaryColor,
                        image: DecorationImage(
                          image: AssetImage('assets/hero_section.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Text(
            "  Enjoy Learning !!!",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: appBarColor),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder(
                future: _fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<Map<String, dynamic>> courses = snapshot.data!;
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: courses.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              childAspectRatio: 1,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemBuilder: (BuildContext context, int index) {
                        return CourseCard(
                            id: courses[index]['_id'],
                            org: courses[index]['org'],
                            imageUrl: courses[index]['coursePhoto'],
                            title: courses[index]['name'],
                            subtitle: courses[index]['desc']);
                      },
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}

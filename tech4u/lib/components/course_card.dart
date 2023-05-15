import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tech4u/api/base_url.dart';
import 'package:tech4u/pages/course_detail.dart';

class CourseCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String org;
  final String title;
  final String subtitle;
  const CourseCard(
      {super.key,
      required this.id,
      required this.org,
      required this.imageUrl,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        child: Column(
          children: [
            Image.network(
              '$baseUrl/$imageUrl',
              fit: BoxFit.cover,
              height: 85.0,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 10.0, bottom: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    "offered by $org",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    subtitle,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return CourseDetail(id: id);
                      }));
                    },
                    child: const Text("See Course Detail",
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            decoration: TextDecoration.underline,
                            fontSize: 13)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/consts[1].dart';
import 'package:flutter_application_1/consts/strings.dart';
import 'package:flutter_application_1/consts/images.dart';
import 'package:flutter_application_1/consts/list.dart';
import 'package:flutter_application_1/pages/body.dart';
import 'package:flutter_application_1/pages/cardio.dart';
import 'package:flutter_application_1/pages/home_page.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to HomePage and replace the current screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage(name: '')), // Provide necessary parameters
            );
          },
        ),
        title: Text(
          AppStrings.category,
          style: TextStyle(
            fontSize: 18,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 200,
          ),
          itemCount: iconsList.length,
          itemBuilder: (BuildContext context, int index) {
            // Check if iconsList and iconsTitleList have the same length
            if (index >= iconsTitleList.length) {
              return SizedBox.shrink(); // Return an empty widget if data is inconsistent
            }

            return GestureDetector(
       
              onTap: () {
               if (index == 0) {
                    
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => bodypage()),
                        );
                      } 
                      else if (index == 1) {
                    
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Cardio()),
                        );
                      } 
              },
              child: Container( 
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        iconsList[index],
                        width: 60,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8), // Added spacing between image and text
                    Text(
                      iconsTitleList[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4), // Added spacing between title and subtitle
                    Text(
                      "13 specialists",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoryDetailView extends StatelessWidget {
  final String title;
  final String image;

  const CategoryDetailView({Key? key, required this.title, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category",style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // This should navigate back to CategoryView
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Add more widgets or content related to the category
          ],
        ),
      ),
    );
  }
}

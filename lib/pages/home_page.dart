import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/drprofile.dart';
import 'package:flutter_application_1/pages/eye.dart';
import 'package:flutter_application_1/pages/liver.dart';
import 'package:flutter_application_1/pages/lungs.dart';
import 'package:flutter_application_1/pages/myappointments.dart';
import 'package:flutter_application_1/pages/nose.dart';
import 'package:flutter_application_1/pages/renal.dart';
import 'package:flutter_application_1/pages/stomach.dart';
import 'package:flutter_application_1/utils/widgets/widgets.dart';
import 'package:flutter_application_1/pages/category.dart';
import 'package:flutter_application_1/pages/settings.dart';
import 'package:flutter_application_1/consts/list.dart';
import 'package:flutter_application_1/pages/body.dart';
import 'package:flutter_application_1/pages/cardio.dart';
import 'package:flutter_application_1/pages/liver.dart';
import 'package:flutter_application_1/pages/drprofile.dart';

class HomePage extends StatefulWidget {
  final String name;

  const HomePage({super.key, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String doctorsname = '';
  String doctorcategory = '';
  String url = '';
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  void _performSearch() {
    String query = _searchController.text;
    print("Search Query: $query");
  }

  void _onBottomNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0: // Home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(name: widget.name)),
        );
        break;
      case 1: // Category
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CategoryView()),
        );
        break;
      case 2: Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyAppointmentsApp()),
              );
        break;
      case 3: // Settings
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Settingsview()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                "Welcome, ${widget.name}",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Nunito_bold',
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    // Handle notification icon press
                    print('Notification icon pressed');
                  },
                ),
                SizedBox(width: 10), // Add some spacing between icons
                IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {
                    // Handle profile icon press
                    print('Profile icon pressed');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: "Search Doctor",
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 10.0),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.grey[600],
                            ),
                            onPressed: _performSearch,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => bodypage()),
                        );
                      } else if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Cardio()),
                        );
                      } else if (index == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => hepto()),
                        );
                      } else if (index == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => renal()),
                        );
                      } else if (index == 4) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => lungs()),
                        );
                      } else if (index == 5) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => nose()),
                        );
                      } else if (index == 6) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => eye()),
                        );
                      } else if (index == 7) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Stomach()),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            padding: const EdgeInsets.all(19),
                            margin: const EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                Image.asset(
                                  iconlist[index],
                                  width: 100,
                                  color: Colors.white,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  icontitlelist[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular Doctors",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(3, (index) {
                  // Set margin for specific items
                  EdgeInsetsGeometry margin;
                  if (index == 0) {
                    margin = EdgeInsets.only(left: 100, right: 0);
                  } else if (index == 1) {
                    margin = EdgeInsets.only(left: 0, right: 0);
                  } else if (index == 2) {
                    margin = EdgeInsets.only(left: 0, right: 100);
                  } else {
                    margin = EdgeInsets.symmetric(horizontal: 12);
                  }

                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        doctorsname = famousdoctorsname[index];
                        doctorcategory = doctorscategory[index];
                        url = famousdoctors[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pro(
                                  doctorsname: doctorsname,
                                  doctorcategory: doctorcategory,url:url)),
                        );
                      } else  if (index == 1) {
                        doctorsname = famousdoctorsname[index];
                        doctorcategory = doctorscategory[index];
                        url = famousdoctors[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pro(
                                  doctorsname: doctorsname,
                                  doctorcategory: doctorcategory,url:url)),
                        );
                      } else  if (index == 2) {
                        doctorsname = famousdoctorsname[index];
                        doctorcategory = doctorscategory[index];
                        url = famousdoctors[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pro(
                                  doctorsname: doctorsname,
                                  doctorcategory: doctorcategory,url:url)),
                        );
                      }
                    },
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: margin,
                      height: 350,
                      width: 350,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.blue,
                            width: 350,
                            height: 258,
                            alignment: Alignment.center,
                            child: Image.network(
                              famousdoctors[index],
                              width: 350,
                              height: 258,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            famousdoctorsname[index],
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          Text(
                            doctorscategory[index],
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(3, (index) {
                  // Set margin for specific items
                  EdgeInsetsGeometry margin;
                  if (index == 0) {
                    margin = EdgeInsets.only(left: 100, right: 0);
                  } else if (index == 1) {
                    margin = EdgeInsets.only(left: 0, right: 0);
                  } else if (index == 2) {
                    margin = EdgeInsets.only(left: 0, right: 100);
                  } else {
                    margin = EdgeInsets.symmetric(horizontal: 12);
                  }

                  return GestureDetector(
                     onTap: () {
                      if (index == 0) {
                        doctorsname = famousdoctorsname1[index];
                        doctorcategory = doctorcategory1[index];
                        url = famousdoctors1[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pro(
                                  doctorsname: doctorsname,
                                  doctorcategory: doctorcategory,url:url)),
                        );
                      } else  if (index == 1) {
                        doctorsname = famousdoctorsname1[index];
                        doctorcategory = doctorcategory1[index];
                        url = famousdoctors1[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pro(
                                  doctorsname: doctorsname,
                                  doctorcategory: doctorcategory,url:url)),
                        );
                      } else  if (index == 2) {
                        doctorsname = famousdoctorsname1[index];
                        doctorcategory = doctorcategory1[index];
                        url = famousdoctors1[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pro(
                                  doctorsname: doctorsname,
                                  doctorcategory: doctorcategory,url:url)),
                        );
                      }
                    },
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: margin,
                      height: 350,
                      width: 350,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.blue,
                            width: 350,
                            height: 258,
                            alignment: Alignment.center,
                            child: Image.network(
                              famousdoctors1[index],
                              width: 350,
                              height: 258,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            famousdoctorsname1[index],
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          Text(
                            doctorcategory1[index],
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(3, (index) {
                  // Set margin for specific items
                  EdgeInsetsGeometry margin;
                  if (index == 0) {
                    margin = EdgeInsets.only(left: 100, right: 0);
                  } else if (index == 1) {
                    margin = EdgeInsets.only(left: 0, right: 0);
                  } else if (index == 2) {
                    margin = EdgeInsets.only(left: 0, right: 100);
                  } else {
                    margin = EdgeInsets.symmetric(horizontal: 12);
                  }

                  return GestureDetector(
                     onTap: () {
                      if (index == 0) {
                        doctorsname = famousdoctorsname2[index];
                        doctorcategory = doctorcategory2[index];
                        url = famousdoctors2[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pro(
                                  doctorsname: doctorsname,
                                  doctorcategory: doctorcategory,url:url)),
                        );
                      } else  if (index == 1) {
                        doctorsname = famousdoctorsname2[index];
                        doctorcategory = doctorcategory2[index];
                        url = famousdoctors2[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pro(
                                  doctorsname: doctorsname,
                                  doctorcategory: doctorcategory,url:url)),
                        );
                      } else  if (index == 2) {
                        doctorsname = famousdoctorsname2[index];
                        doctorcategory = doctorcategory2[index];
                        url = famousdoctors2[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pro(
                                  doctorsname: doctorsname,
                                  doctorcategory: doctorcategory,url:url)),
                        );
                      }
                    },
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: margin,
                      height: 350,
                      width: 350,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.blue,
                            width: 350,
                            height: 258,
                            alignment: Alignment.center,
                            child: Image.network(
                              famousdoctors2[index],
                              width: 350,
                              height: 258,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            famousdoctorsname2[index],
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          Text(
                            doctorcategory2[index],
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {},
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Veiw All",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Lab test",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      print('Item $index tapped');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            padding: const EdgeInsets.all(19),
                            margin: const EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                Image.asset(
                                  labtestimages[index],
                                  width: 160,
                                  color: Colors.white,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  labtitle[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: Mydrawer(name: widget.name),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(
          color: Colors.white,
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 2, 124, 223),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onBottomNavBarItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My appointments'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

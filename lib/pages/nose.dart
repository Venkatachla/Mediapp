import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/list.dart';

class nose extends StatelessWidget {
  const nose({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Popular otolaryngologist doctors",
          style: TextStyle(
              fontSize: 18, fontFamily: 'Nunito_bold', color: Colors.white),
        ),
      ),
        
      body: SingleChildScrollView(
        child: Padding(
          
          padding: EdgeInsets.all(25),
          child: Column(
            children:[ Row(
              children: [
                SizedBox(height: 25),
                  SizedBox(
                    height: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(3, (index) {
                        // Set margin for specific items
                        EdgeInsetsGeometry margin;
                        if (index == 0) {
                          margin = EdgeInsets.only(left: 60, right: 60);
                        } 
                         else if (index == 1) {
                          margin = EdgeInsets.only(left: 60, right: 60);
                        }
                        else if (index == 2) {
                          margin = EdgeInsets.only(left: 60, right: 60);
                        } else {
                          margin = EdgeInsets.symmetric(horizontal: 12);
                        }
            
                        return Container(
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
                                  bodycheckup[index],
                                  width: 350,
                                  height: 258,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                bodycheckupname[index],
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 20),
                              Text(
                                bodycategory[index],
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                  
            
              ],
            ),
            SizedBox(height: 30,),
             Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(3, (index) {
                        // Set margin for specific items
                        EdgeInsetsGeometry margin;
                        if (index == 0) {
                          margin = EdgeInsets.only(left: 60, right: 60);
                        } 
                         else if (index == 1) {
                          margin = EdgeInsets.only(left: 60, right: 60);
                        }
                        else if (index == 2) {
                          margin = EdgeInsets.only(left: 60, right: 60);
                        } else {
                          margin = EdgeInsets.symmetric(horizontal: 12);
                        }
            
                        return Container(
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
                                  bodycheckup1[index],
                                  width: 350,
                                  height: 258,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                bodycheckupname1[index],
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 20),
                              Text(
                                bodycategory1[index],
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                           SizedBox(height: 30,),
                       Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(3, (index) {
                        // Set margin for specific items
                        EdgeInsetsGeometry margin;
                        if (index == 0) {
                          margin = EdgeInsets.only(left: 60, right: 60);
                        } 
                         else if (index == 1) {
                          margin = EdgeInsets.only(left: 60, right: 60);
                        }
                        else if (index == 2) {
                          margin = EdgeInsets.only(left: 60, right: 60);
                        } else {
                          margin = EdgeInsets.symmetric(horizontal: 12);
                        }
            
                        return Container(
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
                                  bodycheckup2[index],
                                  width: 350,
                                  height: 258,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                bodycheckupname2[index],
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 20),
                              Text(
                                bodycategory2[index],
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                     SizedBox(height: 20,
            ),  Container(
              margin: EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {},
                child: Align(
                  alignment: Alignment.centerRight,
                  
                
                  child: Text("Veiw All",style: TextStyle(color: Colors.blue,fontSize: 18, ),
                  ),
                ),
              ),
            ),
              
                  
            
              ],
            ),
      
       ),
        ),
      );
  
  }
}

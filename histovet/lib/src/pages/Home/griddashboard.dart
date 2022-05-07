import 'package:flutter/material.dart';
import 'package:histovet/src/pages/medicine_page.dart';

import '../pet/pets_page.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      "Mascotas", "March, Wednesday", "/pet", "assets/img/vet.png");

  Items item2 = new Items(
    "Groceries",
    "Bocali, Apple",
    "4 Items",
    "assets/img/vet.png",
  );
  Items item3 = new Items(
    "Locations",
    "Lucy Mao going to Office",
    "dsds",
    "assets/img/vet.png",
  );
  Items item4 = new Items(
    "Activity",
    "Rose favirited your Post",
    "ffdsf",
    "assets/img/vet.png",
  );
  Items item5 = new Items(
    "To do",
    "Homework, Design",
    "4 Items",
    "assets/img/vet.png",
  );
  Items item6 = new Items(
    "Settings",
    "",
    "2 Items",
    "assets/img/vet.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;
    
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: [Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/img/vet.png",
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "se",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Mascotas",
                      style: TextStyle(
                          color: Colors.white38,
                          fontSize: 10,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 14,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {Navigator.pushNamed(context, PetsPage.id);},
                    child: Text("Mascotas"),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/img/vet.png",
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "se",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Medicina",
                      style: TextStyle(
                          color: Colors.white38,
                          fontSize: 10,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 14,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {Navigator.pushNamed(context, MedicinePage.id);},
                    child: Text("Medicina"),
                  ),
                ],
              ),
            )
          ]
          ),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items(this.title, this.subtitle, this.event, this.img);
}

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size.width;
    var y = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          children: [
            Container(
              width: x,
              height: y * 0.15,
              child: Row(
                children: [
                  Icon(
                    Icons.grid_view,
                    size: x * 0.08,
                  ),
                  Spacer(),
                  Icon(
                    Icons.all_inclusive_sharp,
                    size: x * 0.08,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                //color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: []),
                    Text(
                      "Hi Furkan 👋",
                      style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1),
                    ),
                    SizedBox(height: x * 0.03),
                    Text("Wellcome to Orix Home.",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18)),
                    SizedBox(height: x * 0.06),
                    Row(
                      children: [
                        Text(
                          "Your",
                          style: TextStyle(fontSize: 26),
                        ),
                        Text(" Rooms",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26)),
                        Spacer(),
                        Container(
                          width: 80,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(" Add",
                                  style: TextStyle(color: Color(0xff50BBBB))),
                              Icon(
                                Icons.add_circle_outline,
                                size: 19,
                                color: Color(0xff50BBBB),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xffE3F6F4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                      ],
                    ),
                    SizedBox(height: x * 0.07),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  room(x, y, black, "Living Room", "living", 5),
                                  room(x, y, kitchenC, "Kitchen", "pan", 4),
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  room(x, y, officeC, "Office", "printer", 10),
                                  room(x, y, bedroomC, "Bedroom", "bed", 6),
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  room(x, y, bathC, "Bathroom", "bed", 7),
                                  room(
                                      x, y, diningC, "Dining Room", "plate", 4),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class room extends StatelessWidget {
  var x, y;
  var color;
  var image;
  var name;
  var deviceNumber;

  room(this.x, this.y, this.color, this.name, this.image, this.deviceNumber);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: x * 0.37,
      height: y * 0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Color(color),
      ),
      child: Column(
        children: [
          Spacer(flex: 4),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            child: Image.asset("assets/$image.png", width: x * 0.088),
          ),
          Spacer(flex: 1),
          Text(
            name,
            style: TextStyle(
                color: color == 0xff0A0101 ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
          Spacer(flex: 1),
          Text(
            "$deviceNumber devices",
            style: TextStyle(
                color: color == 0xff0A0101 ? Colors.white : Colors.black),
          ),
          Spacer(flex: 4),
        ],
      ),
    );
  }
}

const black = 0xff0A0101;
const kitchenC = 0xffFEF5E6;
const officeC = 0xffEAE7F8;
const bedroomC = 0xffCFECF4;
const bathC = 0xffFAEAE9;
const diningC = 0xffEFF7E4;

import 'package:flutter/material.dart';

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map> listecik = List.generate(
          300, //10 oge
          (index) => {"id": index, "name": "Furkan $index"}) //liste olusturdu
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 175, //alan
                childAspectRatio: 1, //yukseklik
                crossAxisSpacing: 25, //yatay bosluk
                mainAxisSpacing: 25), //dikey bosluk
            itemCount: listecik.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                child: Text(listecik[index].toString()),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(25)),
              );
            }),
      ),
    );
  }
}

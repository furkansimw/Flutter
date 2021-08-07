import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class drawer extends StatelessWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: Color(0xff1E1F2C),
          child: Column(
            children: [
              Container(
                height: 150,
                child: Image.asset("assets/images/logo.png"),
              ),
              item("menu_dashbord.svg", "Dashboard"),
              item("menu_tran.svg", "Transaction"),
              item("menu_task.svg", "Task"),
              item("menu_doc.svg", "Documents"),
              item("menu_store.svg", "Store"),
              item("menu_notification.svg", "Notification"),
              item("menu_profile.svg", "Settings"),
              item("menu_setting.svg", "Settings"),
            ],
          ),
        ),
      ),
    );
  }
}

class item extends StatelessWidget {
  var svg, text;
  item(this.svg, this.text);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 50,
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/icons/$svg", color: Colors.white70),
              Spacer(flex: 1),
              Text("$text", style: TextStyle(color: Colors.white70)),
              Spacer(flex: 9),
            ],
          ),
        ),
      ),
    );
  }
}

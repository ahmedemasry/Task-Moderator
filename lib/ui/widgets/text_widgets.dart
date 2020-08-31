import 'package:flutter/material.dart';
import 'package:task_master/utils/constants.dart';

class TextWidgets {
  static Widget sectionTitle(String title, MaterialColor color) {
    return Padding(
        padding:EdgeInsets.only(left: 10),
        child: TextInsideTaskCard(title, color: color,size: 25,height: 2,textAlign: TextAlign.left,));
  }
  static Widget subsSectionTitle(String title, MaterialColor color) {
    return Padding(
        padding:EdgeInsets.only(left: 10),
        child: TextInsideTaskCard(title, color: color,size: 20,height: 2,textAlign: TextAlign.center,));
  }
}


class SectionTitle extends StatelessWidget {
  final String title;
  final MaterialColor color;
  final IconData icon;

  const SectionTitle(this.title, this.color, {Key key, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:EdgeInsets.only(left: 5,top: 10),
        child: Row(
//          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            icon==null?Text(""):Icon(icon,color: color,size: 30,),
            TextInsideTaskCard(title, color: color,size: 25,height: 1,textAlign: TextAlign.center,),
          ],
        ));
  }
}

class SubSectionTitle extends StatelessWidget {
  final String title;
  final MaterialColor color;

  const SubSectionTitle(this.title, this.color, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:EdgeInsets.only(left: 15),
        child: TextInsideTaskCard(title, color: color,size: 20,height: 2,textAlign: TextAlign.left,));
  }
}


class TextInsideTaskCard extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final double height;
  final TextAlign textAlign;

  TextInsideTaskCard(this.text,
      {this.color = Colors.white, this.size = TaskSubtitleSize,
        this.height = 1, this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(color: color, fontSize: size, height: height),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_notihealth/Home/card/isi_card/calories.dart';
import 'package:flutter_application_notihealth/Home/card/isi_card/emoji.dart';
import 'package:flutter_application_notihealth/Home/card/isi_card/sleep.dart';
import 'package:flutter_application_notihealth/Home/card/isi_card/water.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class cardPage extends StatefulWidget {
  const cardPage({super.key});

  @override
  State<cardPage> createState() => _cardPageState();
}

class _cardPageState extends State<cardPage> {
  @override
  final List<Widget> fancyCards = <Widget>[
    FancyCard(
      image: Image.asset("assets/images/card_1.png"),
      title: "Calories",
      titledua: "Meals and your calories",
      color: Color(0xffFF7373),
    ),
    FancyCard(
      image: Image.asset("assets/images/card_1.png"),
      title: "Water",
      titledua: "Drink Water kids",
      color: Color.fromARGB(255, 225, 129, 64),
    ),
    FancyCard(
      image: Image.asset("assets/images/card_2.png"),
      title: "Mood",
      titledua: "Mood Assesssment",
      color: Color(0xffF5F5F5),
    ),
    FancyCard(
      image: Image.asset("assets/images/card_3.png"),
      title: "Sleep",
      titledua: "Sleep reminder & Alarm",
      color: Color(0xffD8BABA),
    ),
  ];
  Widget build(BuildContext context) {
    return Scaffold(body: StackedCardCarousel(items: fancyCards));
  }
}

class FancyCard extends StatelessWidget {
  const FancyCard({
    super.key,
    required this.image,
    required this.title,
    required this.titledua,
    required this.color,
  });

  final Image image;
  final String title;
  final String titledua;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (title == 'Calories') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => caloriesPage()),
            );
          }
          if (title == 'Water') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => waterPage()),
            );
          } else if (title == 'Mood') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => emojiPage()),
            );
          } else if (title == 'Sleep') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => sleepPage()),
            );
          }
        },
        child: Card(
          color: color,
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(65.0, 45.0, 65.0, 45.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 250,
                  height: 250,
                  child: image,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 42,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  titledua,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ));
  }
}

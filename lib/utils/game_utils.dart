import 'package:flutter/material.dart';

class Game {
final Color hiddenCard = Colors.red;
List<Color>? gameColors;
List<String>? gameImg;
List<Color> cards = [
  Colors.green,
  Colors.yellow,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.blue
];
final String hiddenCardpath = "assets/images/hidden.png";
List<String> cards_list = [
  "assets/images/6.png",
  "assets/images/2.png",
  "assets/images/7.png",
  "assets/images/3.png",
  "assets/images/8.png",
  "assets/images/1.png",
  "assets/images/5.png",
  "assets/images/4.png",
  "assets/images/4.png",
  "assets/images/5.png",
  "assets/images/1.png",
  "assets/images/8.png",
  "assets/images/3.png",
  "assets/images/7.png",
  "assets/images/2.png",
  "assets/images/6.png",

  "assets/images/18.png",
  "assets/images/14.png",
  "assets/images/11.png",
  "assets/images/15.png",
  "assets/images/13.png",
  "assets/images/17.png",
  "assets/images/10.png",
  "assets/images/9.png",
  "assets/images/12.png",
  "assets/images/16.png",
  "assets/images/13.png",
  "assets/images/10.png",
  "assets/images/14.png",
  "assets/images/11.png",
  "assets/images/15.png",
  "assets/images/9.png",
  "assets/images/16.png",
  "assets/images/17.png",
  "assets/images/12.png",
  "assets/images/18.png",

  "assets/images/29.png",
  "assets/images/26.png",
  "assets/images/27.png",
  "assets/images/32.png",
  "assets/images/24.png",
  "assets/images/20.png",
  "assets/images/23.png",
  "assets/images/19.png",
  "assets/images/22.png",
  "assets/images/28.png",
  "assets/images/31.png",
  "assets/images/25.png",
  "assets/images/21.png",
  "assets/images/30.png",
  "assets/images/26.png",
  "assets/images/30.png",
  "assets/images/31.png",
  "assets/images/32.png",
  "assets/images/22.png",
  "assets/images/28.png",
  "assets/images/27.png",
  "assets/images/20.png",
  "assets/images/29.png",
  "assets/images/24.png",
  "assets/images/19.png",
  "assets/images/21.png",
  "assets/images/25.png",
  "assets/images/23.png",
  "assets/images/24.png"



];
final int cardCount = 64;// Numero total de cartas dentro de la grilla
// de la forma n x n, con n= cardCount/crossAxisCount
List<Map<int, String>> matchCheck = [];

//methods
void initGame() {
gameColors = List.generate(cardCount, (index) => hiddenCard);
gameImg = List.generate(cardCount, (index) => hiddenCardpath);
}
}
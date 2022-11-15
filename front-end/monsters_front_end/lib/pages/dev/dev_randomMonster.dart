import 'dart:math';
import 'dart:developer' as dv;

const List monsterNamesList = [
  "Baku",
  "Cloud",
  "Coling",
  "Donut",
  "Fuwa",
  "Ghost",
  // "Ika",
  "Kila",
  "Kungfu",
  "Lizi",
  "Lory",
  "Magic",
  "Pen",
  "Pina",
  "Roy",
  "Spider",
  "Sticky",
  "Three",
];

const List monsterNamesList_CH = [
  "巴古",
  "棉花糖",
  "可琳",
  "杜那",
  "乎瓦",
  "疤比",
  // "伊咔",
  "基拉",
  "赫赫",
  "栗茲",
  "酪里",
  "馬奇",
  "潘恩",
  "批奈",
  "蘿依",
  "派特",
  "底迪",
  "三兄弟",
];

String choosenAvatar = "";
String getRandomMonsterName() {
  String random =
      monsterNamesList.elementAt(Random().nextInt(monsterNamesList.length));
  dv.log(random.toString());
  return random.toString();
}

String getMonsterAvatarPath(String monsterName) {
  return 'assets/image/monsters/avatar/Avatar_${monsterName}_PNG.png';
}

String getMonsterImage(String monsterName) {
  return 'assets/image/monsters/monster_$monsterName.png';
}

// getMonsterAvatarPath("Baku","JPG")
String getMonsterAnimationPath(String monsterName, String direction) {
  String dir = direction.toLowerCase();
  return "assets/image/animatedImage/${monsterName}_$dir.gif";
}

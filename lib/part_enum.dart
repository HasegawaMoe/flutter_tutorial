enum PartEnum {
  vocal('assets/icons/vocal.png'),
  guitar('assets/icons/guitar.png'),
  bassGuitar('assets/icons/bass_guitar.png'),
  keyboard('assets/icons/keyboard.png'),
  drum('assets/icons/drum.png'),
  sax('assets/icons/sax.png');

  final String iconPath;
  const PartEnum(this.iconPath);
}

String getIcon(PartEnum part) {
  return part.iconPath;
}

enum IMAGE_CONST {
  img_logo,
  img_logo_128,
  img_test,
  img_down_arrow,
  img_lisa,
  img_jisoo,
  img_jennie,
  img_rose,
}

// ignore: camel_case_extensions
extension IMAGE_CONST_VALUE on IMAGE_CONST {
  String get path {
    switch (this) {
      case IMAGE_CONST.img_logo:
        return 'assets/image/img_music_logo.png';
      case IMAGE_CONST.img_logo_128:
        return 'assets/image/img_music_logo_128.png';
      case IMAGE_CONST.img_test:
        return 'assets/image/img_blackpink.jpeg';
      case IMAGE_CONST.img_down_arrow:
        return 'assets/image/img_down_arrow.png';
      case IMAGE_CONST.img_jennie:
        return 'assets/image/img_jennie.jpg';
      case IMAGE_CONST.img_jisoo:
        return 'assets/image/img_jisoo.jpg';
      case IMAGE_CONST.img_rose:
        return 'assets/image/img_rose.jpg';
      case IMAGE_CONST.img_lisa:
        return 'assets/image/img_lisa.jpg';
      default:
        return '';
    }
  }
}

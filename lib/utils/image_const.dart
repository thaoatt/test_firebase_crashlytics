enum IMAGE_CONST { img_logo, img_logo_128, img_test }

// ignore: camel_case_extensions
extension IMAGE_CONST_VALUE on IMAGE_CONST {
  String get path {
    switch (this) {
      case IMAGE_CONST.img_logo:
        return 'asset/image/img_music_logo.png';
      case IMAGE_CONST.img_logo_128:
        return 'asset/image/img_music_logo_128.png';
        case IMAGE_CONST.img_test:
        return 'asset/image/img_test.PNG';
      default:
        return '';
    }
  }
}

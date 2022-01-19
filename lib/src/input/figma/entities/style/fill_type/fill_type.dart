import 'dart:math';

abstract class FillType {
  FillTypeEnum type;
}

class ImageFillType implements FillType {
  // String that identifies the ID of the image
  String imageRef;

  @override
  FillTypeEnum type;
}

enum FillTypeEnum {
  SOLID,
  LINEAR,
  RADIAL,
  ANGULAR,
  DIAMOND,
  IMAGE,
}

import 'package:restaurant_system/config/assets.dart';

String getImagePath(String type) {
  switch (type) {
    case 'burger':
      return Assets.imagesBurger;
    case 'sandwitch':
      return Assets.imagesDeluxe;
    case 'side':
      return Assets.imagesBigCola;

    case 'Cheese Melt Sandwich':
      return Assets.imagesMeal;

    default:
      return Assets.imagesBurger;
  }
}

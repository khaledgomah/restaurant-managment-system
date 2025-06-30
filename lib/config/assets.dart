
import 'package:flutter/foundation.dart';

class Assets {
  static String _resolve(String path) =>
      kIsWeb ? 'images/$path' : 'assets/images/$path';

  static String get imagesBigCola => _resolve('big_cola.svg');
  static String get imagesBurger => _resolve('burger.svg');
  static String get imagesDeluxe => _resolve('deluxe.svg');
  static String get imagesIceCream => _resolve('ice_cream.svg');
  static String get imagesLogIn => _resolve('log-in.svg');
  static String get imagesLogo => _resolve('logo.png');
  static String get imagesMeal => _resolve('meal.svg');
  static String get imagesMenu => _resolve('menu.svg');
  static String get imagesMoney => _resolve('money.svg');
  static String get imagesOrder => _resolve('order.svg');
  static String get imagesPieChart => _resolve('pie-chart.svg');
  static String get imagesPizza => _resolve('pizza.png');
  static String get imagesSettings => _resolve('settings.svg');
  static String get imagesUsers => _resolve('users.svg');
  static String get imagesArrowLeft => _resolve('arrow-left.svg');
  static String get imagesRealBurger => _resolve('real_burger.png');
  static String get imagesDelete => _resolve('delete.svg');
  static String get imagesAdd => _resolve('add.svg');
  static String get imagesMinus => _resolve('minus.svg');
  static String get imagesRemove => _resolve('remove.svg');
  static String get imagesRightArrow => _resolve('arrow_right.svg');
}

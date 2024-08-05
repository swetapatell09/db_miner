import 'package:db_miner/screen/details/view/details_screen.dart';
import 'package:db_miner/screen/home/view/home_screen.dart';
import 'package:db_miner/screen/like/view/like_screen.dart';
import 'package:db_miner/screen/like_category/view/like_category_screen.dart';
import 'package:db_miner/screen/quotes_detail/view/quotes_detail_screen.dart';
import 'package:db_miner/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> app_routs = {
  "/": (context) => const SplashScreen(),
  "Home": (context) => const HomeScreen(),
  "detail": (context) => const DetailsScreen(),
  "quotes": (context) => const QuotesDetailsScreen(),
  "like": (context) => const LikeScreen(),
  "likec": (context) => const LikeCategoryScreen(),
};

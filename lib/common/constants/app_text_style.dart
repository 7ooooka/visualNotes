
import 'package:flutter/material.dart';
import 'package:visual_notes/common/constants/app_colors.dart';
import 'package:visual_notes/common/constants/app_font_size.dart';

abstract class AppTextStyles {
  // ignore: non_constant_identifier_names
  static TextStyle madium_dark_blue = TextStyle(
      color: AppColors.dark_blue,
      fontSize: AppFontSize.medium,
      fontWeight: FontWeight.bold);

  // ignore: non_constant_identifier_names
  static TextStyle madium_dark_grey_700 = TextStyle(
      color: AppColors.dark_grey_700, fontSize: AppFontSize.medium);

  // ignore: non_constant_identifier_names
  static TextStyle madium_light_green_bold = TextStyle(
      color: AppColors.light_green,
      fontSize: AppFontSize.medium,
      fontWeight: FontWeight.w600);

  // ignore: non_constant_identifier_names
  static TextStyle small_grey = TextStyle(
      color: AppColors.grey, fontSize: AppFontSize.fontSize_small);

  // ignore: non_constant_identifier_names
  static TextStyle medium_white =
      TextStyle(color: AppColors.white, fontSize: AppFontSize.medium);

  // ignore: non_constant_identifier_names
  static TextStyle small_dark_blue_bold = TextStyle(
      color: AppColors.dark_blue,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: AppFontSize.fontSize_small);

  // ignore: non_constant_identifier_names
  static TextStyle small_white_bold = TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: AppFontSize.fontSize_small);

  // ignore: non_constant_identifier_names
  static TextStyle small_dark_grey_bold = TextStyle(
      color: AppColors.dark_grey_500,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: AppFontSize.fontSize_small);

  // ignore: non_constant_identifier_names
  static TextStyle small_dark_grey_500 = TextStyle(
      color: AppColors.dark_grey_500,
      fontSize: AppFontSize.fontSize_small);

  // ignore: non_constant_identifier_names
  static TextStyle medium_dark_grey_500_bold = TextStyle(
      color: AppColors.dark_grey_500,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: AppFontSize.medium);

  // ignore: non_constant_identifier_names
  static TextStyle medium_grey_bold = TextStyle(
      color: AppColors.dark_grey_500,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      fontSize: AppFontSize.medium);

  // ignore: non_constant_identifier_names
  static TextStyle medium_text_with_height =
      TextStyle(height: 1.8, fontSize: 16);

  // ignore: non_constant_identifier_names
  static TextStyle dark_blue_medium_text_with_height = TextStyle(
      height: 1.8,
      fontSize: 16,
      color: AppColors.dark_blue,
      fontWeight: FontWeight.w900);

  // ignore: non_constant_identifier_names
  static TextStyle medium_dark_white_bold = TextStyle(
      color: AppColors.white,
      fontSize: AppFontSize.medium,
      fontWeight: FontWeight.bold);

  // ignore: non_constant_identifier_names
  static TextStyle small_dark_grey_w600 = TextStyle(
      color: AppColors.dark_gray,
      fontSize: AppFontSize.mid_small,
      fontWeight: FontWeight.w600);

  // ignore: non_constant_identifier_names
  static TextStyle small_dark_blue_w600 = TextStyle(
      color: AppColors.dark_blue,
      fontSize: AppFontSize.mid_small,
      fontWeight: FontWeight.w600);

  // ignore: non_constant_identifier_names
  static TextStyle small_black = TextStyle(
    color: Colors.black,
    fontSize: AppFontSize.small,
  );

  // ignore: non_constant_identifier_names
  static TextStyle medium_black = TextStyle(
    color: Colors.black,
    fontSize: AppFontSize.medium,
  );

  // ignore: non_constant_identifier_names
  static TextStyle big_black = TextStyle(
    color: Colors.black,
    fontSize: AppFontSize.x_large,
  );

  // ignore: non_constant_identifier_names
  static TextStyle small_black_600 = TextStyle(
    color: Colors.black,
    fontSize: AppFontSize.small,
    fontWeight: FontWeight.w600,
  );

  // ignore: non_constant_identifier_names
  static TextStyle medium_black_600 = TextStyle(
    color: Colors.black,
    fontSize: AppFontSize.medium,
    fontWeight: FontWeight.w600,
  );

  // ignore: non_constant_identifier_names
  static TextStyle big_black_600 = TextStyle(
    color: Colors.black,
    fontSize: AppFontSize.x_large,
    fontWeight: FontWeight.w600,
  );

  // ignore: non_constant_identifier_names
  static TextStyle small_white = TextStyle(
    color: Colors.white,
    fontSize: AppFontSize.small,
  );

  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names
  static TextStyle big_white = TextStyle(
    color: Colors.white,
    fontSize: AppFontSize.x_large,
  );

  // ignore: non_constant_identifier_names
  static TextStyle small_light_blue_accent = TextStyle(
    color: AppColors.light_blue_accent,
    fontSize: AppFontSize.small,
  );

  // ignore: non_constant_identifier_names
  static TextStyle medium_light_blue_accent = TextStyle(
    color: AppColors.light_blue_accent,
    fontSize: AppFontSize.medium,
  );

  // ignore: non_constant_identifier_names
  static var big_light_blue_accent = TextStyle(
    color: AppColors.light_blue_accent,
    fontSize: AppFontSize.x_large,
  );

  // ignore: non_constant_identifier_names
  static TextStyle small_dark_blue = TextStyle(
    color: AppColors.dark_blue,
    fontSize: AppFontSize.small,
  );

  // ignore: non_constant_identifier_names
  static TextStyle medium_dark_blue = TextStyle(
    color: AppColors.dark_blue,
    fontSize: AppFontSize.medium,
  );
  // ignore: non_constant_identifier_names
  static TextStyle medium_dark_blue_bold = TextStyle(
      color: AppColors.dark_blue,
      fontSize: AppFontSize.medium,
      fontWeight: FontWeight.bold);

      

  // ignore: non_constant_identifier_names
  static var big_dark_blue = TextStyle(
    color: AppColors.dark_blue,
    fontSize: AppFontSize.x_large,
  );

  // ignore: non_constant_identifier_names
  static TextStyle medium_grey = TextStyle(
    color: AppColors.grey,
    fontSize: AppFontSize.medium,
  );

  // ignore: non_constant_identifier_names
  static var big_grey = TextStyle(
    color: AppColors.grey,
    fontSize: AppFontSize.x_large,
  );

  // ignore: non_constant_identifier_names
  static TextStyle small_light_grey = TextStyle(
    color: AppColors.light_grey,
    fontSize: AppFontSize.small,
  );

  // ignore: non_constant_identifier_names
  static TextStyle medium_light_grey = TextStyle(
    color: AppColors.light_grey,
    fontSize: AppFontSize.medium,
  );

  // ignore: non_constant_identifier_names
  static var big_light_grey = TextStyle(
    color: AppColors.light_grey,
    fontSize: AppFontSize.x_large,
  );

  // ignore: non_constant_identifier_names
  static TextStyle small_bold_dark_grey = TextStyle(
    color: AppColors.dark_grey,
    fontSize: AppFontSize.small,
    fontWeight: FontWeight.bold,
  );

  // ignore: non_constant_identifier_names
  static TextStyle medium_bold_dark_grey = TextStyle(
    color: AppColors.dark_grey,
    fontSize: AppFontSize.medium,
    fontWeight: FontWeight.bold,
  );

  // ignore: non_constant_identifier_names
  static var big_bold_dark_grey = TextStyle(
    color: AppColors.dark_grey,
    fontSize: AppFontSize.x_large,
    fontWeight: FontWeight.bold,
  );

  // ignore: non_constant_identifier_names
  static TextStyle small_light_green = TextStyle(
    color: AppColors.light_green,
    fontSize: AppFontSize.small,
  );

  // ignore: non_constant_identifier_names
  static TextStyle medium_light_green = TextStyle(
    color: AppColors.light_green,
    fontSize: AppFontSize.large,
  );

  // ignore: non_constant_identifier_names
  static var big_light_green = TextStyle(
    color: AppColors.light_green,
    fontSize: AppFontSize.x_large,
  );

  // ignore: non_constant_identifier_names
  static var phone_green_hint_style = TextStyle(
      fontSize: AppFontSize.medium, color: AppColors.light_green);

  // ignore: non_constant_identifier_names
  static TextStyle small_dark_red = TextStyle(
    color: AppColors.dark_red,
    fontSize: AppFontSize.small,
  );

  // ignore: non_constant_identifier_names
  static TextStyle medium_dark_red = TextStyle(
    color: AppColors.dark_red,
    fontSize: AppFontSize.medium,
  );

  // ignore: non_constant_identifier_names
  static var big_dark_red = TextStyle(
    color: AppColors.dark_red,
    fontSize: AppFontSize.x_large,
  );

  // ignore: non_constant_identifier_names
  static TextStyle small_light_red = TextStyle(
    color: AppColors.light_red,
    fontSize: AppFontSize.small,
  );

  // ignore: non_constant_identifier_names
  static TextStyle medium_light_red = TextStyle(
    color: AppColors.light_red,
    fontSize: AppFontSize.medium,
  );

  // ignore: non_constant_identifier_names
  static var big_light_red = TextStyle(
    color: AppColors.light_red,
    fontSize: AppFontSize.x_x_x_large,
    fontWeight: FontWeight.bold,
  );

  // ignore: non_constant_identifier_names
  static var big_bold_black =
      TextStyle(fontWeight: FontWeight.w600, fontSize: AppFontSize.large);
  // ignore: non_constant_identifier_names
  static var medium_light_grey_bold_lineTrough = TextStyle(
      color: AppColors.dark_grey_500,
      fontSize: AppFontSize.medium,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.lineThrough);
  // ignore: non_constant_identifier_names
  static var large_dark_blue_w900 = TextStyle(
      color: AppColors.dark_blue,
      fontSize: AppFontSize.large,
      fontWeight: FontWeight.w900);
  // ignore: non_constant_identifier_names
  static var medium_light_green_bold = TextStyle(
      color: AppColors.light_green,
      fontSize: AppFontSize.medium,
      fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static var medium_light_grey_100 = TextStyle(
      fontSize: AppFontSize.medium, color: AppColors.light_grey_100);
  // ignore: non_constant_identifier_names
  static TextStyle medium_black_bold = TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.medium,
      fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static TextStyle big_black_bold = TextStyle(
      color: AppColors.black,
      fontSize: AppFontSize.x_x_large,
      fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static TextStyle small_yellow_bold = TextStyle(
      color: AppColors.light_yellow,
      fontSize: AppFontSize.small,
      fontWeight: FontWeight.w700);
  // ignore: non_constant_identifier_names
  static TextStyle big_yellow_bold = TextStyle(
      color: AppColors.light_yellow,
      fontSize: AppFontSize.x_large,
      fontWeight: FontWeight.w700);
  // ignore: non_constant_identifier_names
  static TextStyle small_light_green_bold = TextStyle(
      color: AppColors.light_green,
      fontSize: AppFontSize.small,
      fontWeight: FontWeight.w700);
  // ignore: non_constant_identifier_names
  static TextStyle small_dark_grey_200 = TextStyle(
      color: AppColors.dark_grey_200,
      fontSize: AppFontSize.fontSize_small);
  // ignore: non_constant_identifier_names
  static TextStyle small_bold_black = TextStyle(
      color: Colors.black,
      fontSize: AppFontSize.small,
      fontWeight: FontWeight.bold);

  // ignore: non_constant_identifier_names
  static TextStyle medium_bold_black = TextStyle(
      color: Colors.black,
      fontSize: AppFontSize.large,
      fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static TextStyle x_small_bold_black = TextStyle(
      color: Colors.black,
      fontSize: AppFontSize.x_small,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold);
  // ignore: non_constant_identifier_names
  static TextStyle x_small_yellow_bold = TextStyle(
      color: AppColors.light_yellow,
      fontSize: AppFontSize.x_small,
      fontWeight: FontWeight.w700);
  // ignore: non_constant_identifier_names
  static var small_light_grey_100 = TextStyle(
      fontSize: AppFontSize.small, color: AppColors.light_grey_100);
  // ignore: non_constant_identifier_names
  static TextStyle x_small_grey_bold = TextStyle(
      color: AppColors.grey,
      fontSize: AppFontSize.x_small,
      fontWeight: FontWeight.w700);

  static TextStyle very_small_dark_grey_bold = TextStyle(
      color: AppColors.dark_grey_500,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: AppFontSize.x_small);

  static var very_small_light_grey_100 = TextStyle(
      fontSize: AppFontSize.x_small, color: AppColors.light_grey_100);

}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/utils/size_config.dart';

class AppStyles{

  static final headingTextStyle = GoogleFonts.mcLaren(
    fontSize: SizeConfig.getProportionatinHeight(28),
    fontWeight: FontWeight.w800,
    color: Colors.black,
  );

  static final titleTextStyle = GoogleFonts.mcLaren(
    fontSize: SizeConfig.getProportionatinHeight(26),
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static final normalTextStyle = GoogleFonts.mcLaren(
    fontSize: SizeConfig.getProportionatinHeight(22),
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );
}


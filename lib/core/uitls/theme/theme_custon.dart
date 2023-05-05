// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluent_ui/fluent_ui.dart';

class ThemeCustom extends ThemeExtension<ThemeCustom> {
  final Color? colorBackground;
  final Color colorPrimary;
  final BoxDecoration? decoration;

  ThemeCustom({
    this.colorBackground,
    this.colorPrimary = const Color.fromARGB(255, 2, 119, 189),
    this.decoration,
  });

  @override
  ThemeCustom copyWith(
      {Color? color, BoxDecoration? decoration, Color? colorPrimary}) {
    return ThemeCustom(
      colorBackground: color ?? this.colorBackground,
      colorPrimary: colorPrimary ?? this.colorPrimary,
      decoration: decoration ?? this.decoration,
    );
  }

  @override
  ThemeCustom lerp(ThemeExtension<ThemeCustom>? other, double t) {
    if (other is! ThemeCustom) {
      return this;
    }
    return ThemeCustom(
      colorBackground: Color.lerp(colorBackground, other.colorBackground, t),
      decoration: BoxDecoration.lerp(decoration, other.decoration, t),
    );
  }
}

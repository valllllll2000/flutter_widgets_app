import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

final colorListProvider = StateProvider<List<Color>>((ref) => colorList);

final selectedColorProvider = StateProvider<int>((ref) => 0);

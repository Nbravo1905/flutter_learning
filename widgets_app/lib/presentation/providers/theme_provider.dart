import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Lista de colores inmutable
final colorListProvider = Provider((ref) => colorList);

final isDarkModeProvider = StateProvider<bool>((ref) => false);

final selectedColorProvider = StateProvider<int>((ref) => 0);



// Objeto de tipo AppTheme Custom
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);

// Controller
class ThemeNotifier extends StateNotifier<AppTheme> {

  // STATE = new AppTheme()
  ThemeNotifier(): super( AppTheme() );

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode );
  }

  void changeColorIndex(int indexColor) {
    state = state.copyWith(
      selectedColor: indexColor
    );
  }

}
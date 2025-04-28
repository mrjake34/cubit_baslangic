import 'package:flutter/material.dart';

/// Defines the application's theme settings.
final class AppTheme {
  AppTheme._(); // Private constructor

  // Define core colors inspired by X theme
  static const Color _primaryBlue = Color(0xFF1DA1F2); // X Blue
  static const Color _scaffoldBackground = Colors.white;
  static const Color _appBarBackground = Colors.white;
  static const Color _textColor = Colors.black87;
  static const Color _secondaryTextColor = Colors.grey;
  static const Color _dividerColor = Color(
    0xFFE1E8ED,
  ); // Light grey for dividers

  /// Light theme configuration based on X's light mode.
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true, // Enable Material 3 features
    brightness: Brightness.light,
    scaffoldBackgroundColor: _scaffoldBackground,
    primaryColor: _primaryBlue,
    fontFamily: 'Roboto', // Or choose another clean sans-serif font

    colorScheme: const ColorScheme.light(
      primary: _primaryBlue,
      secondary: _primaryBlue, // Often used for FloatingActionButtons etc.
      surface: Colors.white, // Card backgrounds, dialogs etc.
      onPrimary: Colors.white, // Text/icons on primary color
      onSecondary: Colors.white,
      onSurface: _textColor, // Text/icons on surface color
      error: Colors.redAccent,
      onError: Colors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: _appBarBackground,
      foregroundColor: _textColor, // Color for title and icons
      elevation: 0, // Flat app bar
      scrolledUnderElevation: 0.5, // Slight elevation when scrolled under
      surfaceTintColor: Colors.transparent, // Keep white when scrolled
      iconTheme: IconThemeData(color: _textColor),
      titleTextStyle: TextStyle(
        color: _textColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      // Add bottom border like X
      shape: Border(bottom: BorderSide(color: _dividerColor, width: 1)),
    ),

    textTheme: const TextTheme(
      // Define various text styles
      titleLarge: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: _textColor, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(color: _textColor, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(color: _textColor),
      bodyMedium: TextStyle(color: _textColor),
      bodySmall: TextStyle(color: _secondaryTextColor),
      labelLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ), // For buttons
    ).apply(bodyColor: _textColor, displayColor: _textColor),

    dividerTheme: const DividerThemeData(
      color: _dividerColor,
      thickness: 1,
      space: 1, // Typically space is handled by padding around the divider
    ),

    listTileTheme: const ListTileThemeData(
      // Customize ListTile defaults if needed
      iconColor: _secondaryTextColor,
    ),

    cardTheme: const CardTheme(
      elevation: 0, // Remove card shadows by default
      shape: RoundedRectangleBorder(
        // Keep slight rounding or make rectangular
        // borderRadius: BorderRadius.circular(8.0),
        // side: BorderSide(color: _dividerColor, width: 1), // Optional border
      ),
      margin: EdgeInsets.zero, // Control margin via padding instead
      color: Colors.white,
    ),

    iconTheme: const IconThemeData(
      color: _secondaryTextColor, // Default icon color
      size: 24,
    ),

    buttonTheme: const ButtonThemeData(
      buttonColor: _primaryBlue,
      textTheme: ButtonTextTheme.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0, // Flat buttons
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Pill shape
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _primaryBlue, // Blue text for text buttons
      ),
    ),

    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        // Example border style
        borderSide: BorderSide(color: _dividerColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _primaryBlue, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      hintStyle: TextStyle(color: _secondaryTextColor),
    ),

    // Add other theme customizations as needed (FloatingActionButton, BottomNavigationBar, etc.)
  );

  // Optional: Define a dark theme as well
  // static final ThemeData darkTheme = ThemeData(...);
}

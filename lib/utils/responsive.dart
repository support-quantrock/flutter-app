import 'package:flutter/material.dart';

/// Responsive utility for adaptive sizing across different screen sizes
class Responsive {
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _scaleFactor;
  static late bool _isTablet;
  static late bool _isDesktop;

  /// Initialize with context - call this at the top of build methods
  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;

    // Base scale on 375 width (iPhone SE) as reference
    _scaleFactor = (_screenWidth / 375).clamp(0.8, 1.5);

    _isTablet = _screenWidth >= 600;
    _isDesktop = _screenWidth >= 1024;
  }

  /// Screen dimensions
  static double get screenWidth => _screenWidth;
  static double get screenHeight => _screenHeight;
  static double get scaleFactor => _scaleFactor;
  static bool get isTablet => _isTablet;
  static bool get isDesktop => _isDesktop;

  /// Scale a value based on screen width
  static double scale(double value) => value * _scaleFactor;

  /// Scale font size with a smaller factor to avoid too large fonts
  static double fontSize(double value) {
    final factor = (_screenWidth / 375).clamp(0.85, 1.3);
    return value * factor;
  }

  /// Responsive horizontal padding
  static double get horizontalPadding {
    if (_isDesktop) return 40;
    if (_isTablet) return 32;
    return 16;
  }

  /// Responsive vertical padding
  static double get verticalPadding {
    if (_isDesktop) return 32;
    if (_isTablet) return 24;
    return 16;
  }

  /// Get adaptive image height based on screen size
  static double imageHeight({double mobile = 200, double tablet = 280, double desktop = 350}) {
    if (_isDesktop) return desktop;
    if (_isTablet) return tablet;
    return mobile * _scaleFactor.clamp(0.9, 1.2);
  }

  /// Get adaptive icon size
  static double iconSize({double mobile = 24}) {
    return scale(mobile).clamp(20.0, 40.0);
  }

  /// Get adaptive button height
  static double buttonHeight({double mobile = 52}) {
    return scale(mobile).clamp(48.0, 64.0);
  }

  /// Get adaptive card width for grids
  static double cardWidth({int columns = 2, double spacing = 12}) {
    final availableWidth = _screenWidth - (horizontalPadding * 2) - (spacing * (columns - 1));
    return availableWidth / columns;
  }

  /// Get number of columns for grid based on screen width
  static int gridColumns({int mobile = 2, int tablet = 3, int desktop = 4}) {
    if (_isDesktop) return desktop;
    if (_isTablet) return tablet;
    return mobile;
  }

  /// Responsive mascot size
  static double get mascotWidth {
    if (_isDesktop) return 120;
    if (_isTablet) return 100;
    return scale(80).clamp(60.0, 100.0);
  }

  /// Responsive spinner/game element size
  static double get gameElementSize {
    final baseSize = _screenWidth * 0.55;
    return baseSize.clamp(200.0, 350.0);
  }

  /// Get max content width for larger screens
  static double get maxContentWidth {
    if (_isDesktop) return 800;
    if (_isTablet) return 600;
    return _screenWidth;
  }

  /// Wrap widget with max width constraint for larger screens
  static Widget constrain(Widget child) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxContentWidth),
        child: child,
      ),
    );
  }
}

/// Extension on BuildContext for easy access
extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  bool get isTablet => screenWidth >= 600;
  bool get isDesktop => screenWidth >= 1024;

  /// Scale a value based on screen width
  double scale(double value) {
    final factor = (screenWidth / 375).clamp(0.8, 1.5);
    return value * factor;
  }

  /// Scale font size
  double fontSize(double value) {
    final factor = (screenWidth / 375).clamp(0.85, 1.3);
    return value * factor;
  }
}

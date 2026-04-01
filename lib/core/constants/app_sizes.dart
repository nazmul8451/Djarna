import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Central typography constants for the Photopia application.
/// Uses [flutter_screenutil] to ensure responsiveness across all devices.
class AppTypography {
  // --- Headings ---

  /// App bar titles, Main headers (e.g., "Photopia", "Select a Package")
  static double get h1 => 20.sp;

  /// Section titles, Step titles (e.g., "Step 1 of 4", "Review Booking")
  static double get h2 => 18.sp;

  // --- Body Text & Labels ---

  /// Primary labels, Highlighted values (e.g., "Available Dates", Service Title)
  static double get bodyLarge => 16.sp;

  /// General body text, Descriptions, Tab labels
  static double get bodyMedium => 14.sp;

  /// Captions, Time stamps, Tags, Unimportant info
  static double get bodySmall => 12.sp;
}

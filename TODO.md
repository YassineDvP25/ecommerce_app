# Plan: Convert Container to AnimatedContainer in category_list.dart

## Information Gathered:
- `category_list.dart` contains two Container widgets:
  - `_buildActivePill()` - Black capsule with orange icon and text
  - `_buildInactiveCircle()` - White circle with black icon
- Currently there's NO animation when switching between categories - it switches instantly
- `bottom_nav_bar.dart` shows a professional example of AnimatedContainer with:
  - `duration: const Duration(milliseconds: 500)`
  - Animated padding, decoration, etc.

## Plan:
- [x] Convert `_buildActivePill()` Container to AnimatedContainer with animated:
  - padding, decoration (gradient, borderRadius)
- [x] Convert `_buildInactiveCircle()` Container to AnimatedContainer with animated:
  - width, height, decoration
- [x] Add proper duration (500ms) and curve (easeInOut) for smooth professional animation
- [x] Remove unused old methods (_buildActivePill, _buildInactiveCircle)

## Dependent Files:
- lib/features/home/widgets/category_list.dart (only file to edit)

## Followup steps:
- Test the animation by running the Flutter app
- Verify smooth transitions between active/inactive states

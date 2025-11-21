import 'package:flutter/widgets.dart';
import 'package:m_one/core/theme/app_sizes.dart';

/// Padding constants based on AppSizes scale
/// 
/// xs -> 2.0
/// 
/// sm -> 4.0
/// 
/// md -> 8.0
/// 
/// lg -> 16.0
/// 
/// xl -> 20.0
/// 
/// xxl -> 24.0
/// 
/// xxxl -> 32.0
abstract final class AppPaddings {
  // All
  static const allXs = EdgeInsets.all(AppSizes.xs);
  static const allSm = EdgeInsets.all(AppSizes.sm);
  static const allMd = EdgeInsets.all(AppSizes.md);
  static const allLg = EdgeInsets.all(AppSizes.lg);
  static const allXl = EdgeInsets.all(AppSizes.xl);
  static const allXxl = EdgeInsets.all(AppSizes.xxl);
  static const allXxxl = EdgeInsets.all(AppSizes.xxxl);

  // Horizontal
  static const horizontalXs = EdgeInsets.symmetric(horizontal: AppSizes.xs);
  static const horizontalSm = EdgeInsets.symmetric(horizontal: AppSizes.sm);
  static const horizontalMd = EdgeInsets.symmetric(horizontal: AppSizes.md);
  static const horizontalLg = EdgeInsets.symmetric(horizontal: AppSizes.lg);
  static const horizontalXl = EdgeInsets.symmetric(horizontal: AppSizes.xl);
  static const horizontalXxl = EdgeInsets.symmetric(horizontal: AppSizes.xxl);
  static const horizontalXxxl = EdgeInsets.symmetric(horizontal: AppSizes.xxxl);

  // Vertical
  static const verticalXs = EdgeInsets.symmetric(vertical: AppSizes.xs);
  static const verticalSm = EdgeInsets.symmetric(vertical: AppSizes.sm);
  static const verticalMd = EdgeInsets.symmetric(vertical: AppSizes.md);
  static const verticalLg = EdgeInsets.symmetric(vertical: AppSizes.lg);
  static const verticalXl = EdgeInsets.symmetric(vertical: AppSizes.xl);
  static const verticalXxl = EdgeInsets.symmetric(vertical: AppSizes.xxl);
  static const verticalXxxl = EdgeInsets.symmetric(vertical: AppSizes.xxxl);

  // Only left
  static const leftXs = EdgeInsets.only(left: AppSizes.xs);
  static const leftSm = EdgeInsets.only(left: AppSizes.sm);
  static const leftMd = EdgeInsets.only(left: AppSizes.md);
  static const leftLg = EdgeInsets.only(left: AppSizes.lg);
  static const leftXl = EdgeInsets.only(left: AppSizes.xl);

  // Only right
  static const rightXs = EdgeInsets.only(right: AppSizes.xs);
  static const rightSm = EdgeInsets.only(right: AppSizes.sm);
  static const rightMd = EdgeInsets.only(right: AppSizes.md);
  static const rightLg = EdgeInsets.only(right: AppSizes.lg);
  static const rightXl = EdgeInsets.only(right: AppSizes.xl);

  // Only top
  static const topXs = EdgeInsets.only(top: AppSizes.xs);
  static const topSm = EdgeInsets.only(top: AppSizes.sm);
  static const topMd = EdgeInsets.only(top: AppSizes.md);
  static const topLg = EdgeInsets.only(top: AppSizes.lg);
  static const topXl = EdgeInsets.only(top: AppSizes.xl);

  // Only bottom
  static const bottomXs = EdgeInsets.only(bottom: AppSizes.xs);
  static const bottomSm = EdgeInsets.only(bottom: AppSizes.sm);
  static const bottomMd = EdgeInsets.only(bottom: AppSizes.md);
  static const bottomLg = EdgeInsets.only(bottom: AppSizes.lg);
  static const bottomXl = EdgeInsets.only(bottom: AppSizes.xl);
}

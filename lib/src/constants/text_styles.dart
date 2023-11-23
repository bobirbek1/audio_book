import 'package:audio_book/gen/colors.gen.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  //  Light text styles
  TextStyle get light48;
  TextStyle get light32;
  TextStyle get light24;
  TextStyle get light20;
  TextStyle get light16;
  TextStyle get light14;
  TextStyle get light12;
  TextStyle get light10;

  //  Regular text styles
  TextStyle get regular48;
  TextStyle get regular32;
  TextStyle get regular24;
  TextStyle get regular20;
  TextStyle get regular16;
  TextStyle get regular14;
  TextStyle get regular12;
  TextStyle get regular10;

  //  Medium text styles
  TextStyle get medium48;
  TextStyle get medium32;
  TextStyle get medium24;
  TextStyle get medium20;
  TextStyle get medium16;
  TextStyle get medium14;
  TextStyle get medium12;
  TextStyle get medium10;

  //  Semi bold text styles
  TextStyle get semiBold48;
  TextStyle get semiBold32;
  TextStyle get semiBold24;
  TextStyle get semiBold20;
  TextStyle get semiBold16;
  TextStyle get semiBold14;
  TextStyle get semiBold12;
  TextStyle get semiBold10;

  //  Bold text styles
  TextStyle get bold48;
  TextStyle get bold32;
  TextStyle get bold24;
  TextStyle get bold20;
  TextStyle get bold16;
  TextStyle get bold14;
  TextStyle get bold12;
  TextStyle get bold10;
}

class LightTextStyles extends TextStyles {
  // light Text styles
  @override
  TextStyle get light48 => const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w300,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get light32 => const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w300,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get light24 => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w300,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get light20 => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get light16 => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get light14 => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get light12 => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get light10 => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w300,
    color: ColorName.neutral80,
  );

  // Regular text styles
  @override
  TextStyle get regular48 => const TextStyle(
    fontSize: 48,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get regular32 => const TextStyle(
    fontSize: 32,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get regular24 => const TextStyle(
    fontSize: 24,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get regular20 => const TextStyle(
    fontSize: 20,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get regular16 => const TextStyle(
    fontSize: 16,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get regular14 => const TextStyle(
    fontSize: 14,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get regular12 => const TextStyle(
    fontSize: 12,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get regular10 => const TextStyle(
    fontSize: 10,
    color: ColorName.neutral80,
  );

  // Medium text styles
  @override
  TextStyle get medium48 => const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w500,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get medium32 => const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get medium24 => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get medium20 => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get medium16 => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get medium14 => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get medium12 => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get medium10 => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: ColorName.neutral80,
  );

  // Semibold text styles
  @override
  TextStyle get semiBold48 => const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get semiBold32 => const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get semiBold24 => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get semiBold20 => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get semiBold16 => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get semiBold14 => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get semiBold12 => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get semiBold10 => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: ColorName.neutral80,
  );

  // Bold text styles
  @override
  TextStyle get bold48 => const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get bold32 => const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get bold24 => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get bold20 => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get bold16 => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get bold14 => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get bold12 => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: ColorName.neutral80,
  );
  @override
  TextStyle get bold10 => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: ColorName.neutral80,
  );
}

class DarkTextStyles extends TextStyles {
  // light Text styles
  @override
  TextStyle get light48 => const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w300,
    color: ColorName.white,
  );
  @override
  TextStyle get light32 => const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w300,
    color: ColorName.white,
  );
  @override
  TextStyle get light24 => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w300,
    color: ColorName.white,
  );
  @override
  TextStyle get light20 => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: ColorName.white,
  );
  @override
  TextStyle get light16 => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: ColorName.white,
  );
  @override
  TextStyle get light14 => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: ColorName.white,
  );
  @override
  TextStyle get light12 => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: ColorName.white,
  );
  @override
  TextStyle get light10 => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w300,
    color: ColorName.white,
  );

  // Regular text styles
  @override
  TextStyle get regular48 => const TextStyle(
    fontSize: 48,
    color: ColorName.white,
  );
  @override
  TextStyle get regular32 => const TextStyle(
    fontSize: 32,
    color: ColorName.white,
  );
  @override
  TextStyle get regular24 => const TextStyle(
    fontSize: 24,
    color: ColorName.white,
  );
  @override
  TextStyle get regular20 => const TextStyle(
    fontSize: 20,
    color: ColorName.white,
  );
  @override
  TextStyle get regular16 => const TextStyle(
    fontSize: 16,
    color: ColorName.white,
  );
  @override
  TextStyle get regular14 => const TextStyle(
    fontSize: 14,
    color: ColorName.white,
  );
  @override
  TextStyle get regular12 => const TextStyle(
    fontSize: 12,
    color: ColorName.white,
  );
  @override
  TextStyle get regular10 => const TextStyle(
    fontSize: 10,
    color: ColorName.white,
  );

  // Medium text styles
  @override
  TextStyle get medium48 => const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w500,
    color: ColorName.white,
  );
  @override
  TextStyle get medium32 => const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: ColorName.white,
  );
  @override
  TextStyle get medium24 => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: ColorName.white,
  );
  @override
  TextStyle get medium20 => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: ColorName.white,
  );
  @override
  TextStyle get medium16 => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ColorName.white,
  );
  @override
  TextStyle get medium14 => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ColorName.white,
  );
  @override
  TextStyle get medium12 => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: ColorName.white,
  );
  @override
  TextStyle get medium10 => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: ColorName.white,
  );

  // Semibold text styles
  @override
  TextStyle get semiBold48 => const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    color: ColorName.white,
  );
  @override
  TextStyle get semiBold32 => const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: ColorName.white,
  );
  @override
  TextStyle get semiBold24 => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: ColorName.white,
  );
  @override
  TextStyle get semiBold20 => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ColorName.white,
  );
  @override
  TextStyle get semiBold16 => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ColorName.white,
  );
  @override
  TextStyle get semiBold14 => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: ColorName.white,
  );
  @override
  TextStyle get semiBold12 => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: ColorName.white,
  );
  @override
  TextStyle get semiBold10 => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: ColorName.white,
  );

  // Bold text styles
  @override
  TextStyle get bold48 => const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: ColorName.white,
  );
  @override
  TextStyle get bold32 => const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: ColorName.white,
  );
  @override
  TextStyle get bold24 => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ColorName.white,
  );
  @override
  TextStyle get bold20 => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ColorName.white,
  );
  @override
  TextStyle get bold16 => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: ColorName.white,
  );
  @override
  TextStyle get bold14 => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: ColorName.white,
  );
  @override
  TextStyle get bold12 => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: ColorName.white,
  );
  @override
  TextStyle get bold10 => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: ColorName.white,
  );
}

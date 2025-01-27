import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Utils/Const/app_colors.dart';
import '../Utils/Const/app_string.dart';
import 'app_text.dart';

class CustomTextField extends StatelessWidget {
  // Core properties
  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final bool readOnly;
  final bool? enabled;

  // Styling properties
  final Color? fillColor;
  final double borderRadius;
  final double? stackedButtonWidth;
  final FontWeight hintTextFontWeight;
  final bool showBorder;
  final EdgeInsetsGeometry? contentPadding;
  final double? stackedWidgetWidth;
  final Widget? stackedWidget;
  final double? prefixStackedWidgetWidth;
  final Widget? prefixStackedWidget;

  // Icon properties
  final String? suffixIcon;
  final double? suffixIconSize;
  final EdgeInsets? suffixIconPadding;
  final String? prefixIcon;
  final EdgeInsets? prefixIconPadding;

  // Input and behavior properties
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final String obscuringCharacter;
  final bool fieldRequired;
  final bool bordered;
  final bool showAllBorder;
  final int? maxLine;

  // Event handlers
  final void Function()? onTap;
  final void Function(String)? onChanged;

  // Validation
  final String? validationText;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomTextField({
    super.key,
    this.controller,
    this.title,
    this.hintText,
    this.readOnly = false,
    this.enabled,
    this.fillColor,
    this.borderRadius = 36,
    this.stackedWidgetWidth,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.fieldRequired = true,
    this.bordered = false,
    this.onTap,
    this.onChanged,
    this.validationText,
    this.fontSize,
    this.fontWeight,
    this.suffixIconSize,
    this.suffixIconPadding,
    this.prefixIconPadding,
    this.hintTextFontWeight = FontWeight.w400,
    this.maxLine,
    this.showBorder = true,
    this.contentPadding,
    this.showAllBorder = false,
    this.stackedWidget,
    this.stackedButtonWidth,
    this.prefixStackedWidgetWidth,
    this.prefixStackedWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Row(
            children: [
              AppText(
                title ?? "",
                fontWeight: fontWeight ?? FontWeight.w500,
                fontSize: fontSize ?? 15,
              ),
              Visibility(
                visible: fieldRequired,
                child: AppText(
                  " *",
                  fontWeight: fontWeight ?? FontWeight.w500,
                  fontSize: fontSize ?? 15,
                  color: AppColors.red,
                ),
              )
            ],
          ),
          6.verticalSpace,
        ],
        Stack(
          alignment: prefixStackedWidget != null ? Alignment.centerLeft : Alignment.centerRight,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller,
                  keyboardType: keyboardType,
                  obscureText: obscureText,
                  obscuringCharacter: obscuringCharacter,
                  onChanged: onChanged,
                  enabled: enabled,
                  inputFormatters: inputFormatters,
                  style: TextStyle(
                    fontSize: fontSize ?? 15,
                    fontWeight: fontWeight ?? FontWeight.w500,
                    fontFamily: AppString.graphik,
                    color: AppColors.textColor,
                  ),
                  decoration: InputDecoration(
                    contentPadding: stackedWidgetWidth != null || prefixStackedWidgetWidth != null
                        ? EdgeInsets.only(
                            top: 12,
                            bottom: 12,
                            left: prefixStackedWidgetWidth != null ? (prefixStackedWidgetWidth! + 16) : 20,
                            right: stackedWidgetWidth != null ? (stackedWidgetWidth! + 12) : 20,
                          )
                        : const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: AppColors.textColor.withOpacity(0.6),
                      fontSize: fontSize ?? 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppString.graphik,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: bordered ? const BorderSide(color: AppColors.primaryBorderColor) : BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxWidth: 40.w,
                      maxHeight: 50.w,
                      minHeight: 40.w,
                      minWidth: 30.w,
                    ),
                    prefixIcon: prefixIcon != null
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: onTap,
                              highlightColor: AppColors.transparent,
                              splashColor: AppColors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              child: Padding(
                                padding: prefixIconPadding ??
                                    const EdgeInsets.only(
                                      left: 12,
                                      top: 11,
                                      bottom: 11,
                                      right: 4,
                                    ),
                                child: SvgPicture.asset(prefixIcon!),
                              ),
                            ),
                          )
                        : null,
                    suffixIcon: suffixIcon != null
                        ? InkWell(
                            onTap: onTap,
                            highlightColor: AppColors.transparent,
                            splashColor: AppColors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            child: Padding(
                              padding: suffixIconPadding ?? const EdgeInsets.only(right: 8, top: 15, bottom: 15),
                              child: SvgPicture.asset(
                                suffixIcon!,
                                height: suffixIconSize ?? 10,
                                width: suffixIconSize ?? 10,
                              ),
                            ),
                          )
                        : null,
                    filled: true,
                    fillColor: fillColor ?? AppColors.white,
                  ),
                ),
              ],
            ),
            if (prefixStackedWidget != null)
              Padding(
                padding: const EdgeInsets.all(8),
                child: prefixStackedWidget!,
              ),
            if (stackedWidget != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: stackedWidget!,
              )
          ],
        ),
        if (validationText != null) ...[
          6.verticalSpace,
          AppText(
            validationText!,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.red,
          ).paddingSymmetric(horizontal: 20),
        ],
      ],
    );
  }
}

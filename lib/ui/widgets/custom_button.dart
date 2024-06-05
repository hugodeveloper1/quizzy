import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.value = 'Sin definir',
    this.icon,
    this.width,
    this.backgroundColor,
    this.textColor,
  });

  final VoidCallback? onTap;
  final String value;
  final IconData? icon;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;

  double get radius => 12;
  double get sizeIcon => 18;
  double get heightButton => 50;

  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return ElevatedButton(
        style: buttonStyle(context),
        clipBehavior: Clip.antiAlias,
        onPressed: onTap,
        child: text(context),
      );
    } else {
      return ElevatedButton.icon(
        style: buttonStyle(context),
        clipBehavior: Clip.antiAlias,
        onPressed: onTap,
        icon: Icon(icon, size: sizeIcon),
        label: text(context),
      );
    }
  }

  Widget text(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      value,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.bodyMedium!.copyWith(
        color: textColor ?? theme.scaffoldBackgroundColor,
        fontSize: 15,
      ),
    );
  }

  ButtonStyle buttonStyle(BuildContext context) {
    final theme = Theme.of(context);
    return ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(
        backgroundColor ?? theme.primaryColor,
      ),
      elevation: const WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      )),
      iconColor: WidgetStatePropertyAll(
        textColor ?? theme.scaffoldBackgroundColor,
      ),
      shadowColor: const WidgetStatePropertyAll(Colors.black12),
      iconSize: WidgetStatePropertyAll(sizeIcon),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 20),
      ),
      fixedSize: WidgetStatePropertyAll(
        width != null
            ? Size(width!, heightButton)
            : Size.fromHeight(heightButton),
      ),
    );
  }
}

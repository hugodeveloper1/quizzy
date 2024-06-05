import 'package:app_web/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    this.header,
    this.body = const [],
    this.bottom,
    this.sizeWidth = 600,
    this.controller,
    this.marginHorizontal = 0,
  });

  final Widget? header;
  final List<Widget> body;
  final Widget? bottom;
  final double sizeWidth;
  final AnimationController? controller;
  final double marginHorizontal;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomCard(
      width: sizeWidth,
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: header,
          ),
          _divider(size, true),
          ...body.map((e) {
            return e;
          }),
          _divider(size, false),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: bottom,
          ),
        ],
      ),
    );
  }

  Widget _divider(Size size, bool timer) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      child: Column(
        children: [
          if (timer) ...[
            controller == null
                ? const SizedBox.shrink()
                : LinearProgressIndicator(
                    minHeight: 3,
                    value: controller!.value,
                  ),
          ],
          Divider(
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}

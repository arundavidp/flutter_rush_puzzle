import 'package:flutter/material.dart';
import 'package:zflutter/zflutter.dart';

class ZRectNetSize {
  ZRectNetSize({
    required this.height,
    required this.width,
    required this.depth,
  });

  final double height;
  final double width;
  final double depth;
}

abstract class ZRectNet extends StatelessWidget {
  const ZRectNet({
    Key? key,
  }) : super(key: key);

  Widget get top;
  Widget get bottom;
  Widget get right;
  Widget get left;
  Widget get front;
  Widget get back;

  ZRectNetSize size(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final size = this.size(context);

    final topFace = ZPositioned(
      translate: ZVector.only(
        z: size.height / 2,
      ),
      rotate: const ZVector.only(z: -tau / 4),
      child: top,
    );

    final bottomFace = ZPositioned(
      translate: ZVector.only(
        z: -size.height / 2,
      ),
      rotate: const ZVector.only(z: -tau / 4),
      child: bottom,
    );

    final backFace = ZPositioned(
      translate: ZVector.only(
        z: size.width / 2,
      ),
      rotate: const ZVector.only(z: -tau / 4),
      child: ZPositioned(
        rotate: const ZVector.only(y: tau / 4),
        child: back,
      ),
    );

    final frontFace = ZPositioned(
      translate: ZVector.only(
        z: -(size.width / 2),
      ),
      rotate: const ZVector.only(z: -tau / 4),
      child: ZPositioned(
        rotate: const ZVector.only(y: tau / 4),
        child: front,
      ),
    );

    final leftFace = ZPositioned(
      translate: ZVector.only(
        y: -size.depth / 2,
      ),
      rotate: const ZVector.only(x: tau / 4),
      child: left,
    );

    final rightFace = ZPositioned(
      translate: ZVector.only(
        y: size.depth / 2,
      ),
      rotate: const ZVector.only(x: tau / 4),
      child: right,
    );

    return ZGroup(
      sortMode: SortMode.update,
      children: [
        topFace,
        bottomFace,
        backFace,
        frontFace,
        leftFace,
        rightFace,
      ],
    );
  }
}

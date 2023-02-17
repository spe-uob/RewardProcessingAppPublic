import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final double? divisions;
  final Function onChanged;
  final String? label;
  final bool showLabel;
  const MySlider(
      {Key? key,
      required this.value,
      required this.onChanged,
      this.min = 0.0,
      this.max = 100.0,
      this.label,
      this.showLabel = false,
      this.divisions})
      : super(key: key);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double value = 0;
  final GlobalKey globalKey = GlobalKey();
  double? width = 0;
  bool showLabel = false;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  void computeValue() {
    if (widget.divisions != null) {
      if (widget.divisions != null) {
        for (var i = 0; i <= widget.divisions!; i++) {
          var v =
              widget.min + (i / widget.divisions!) * (widget.max - widget.min);
          if (i < widget.divisions!) {
            var vNext = widget.min +
                ((i + 1) / widget.divisions!) * (widget.max - widget.min);
            if (value < v + (vNext - v) && value > v + (vNext - v) / 2) {
              setState(() {
                value = vNext;
              });
              break;
            } else if (value < v + (vNext - v) / 2 && value > v) {
              setState(() {
                value = v;
              });
              break;
            }
          } else {
            setState(() {
              value = v;
            });
            break;
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> divisionWigets = [];
    if (widget.divisions != null) {
      for (var i = 0; i <= widget.divisions!; i++) {
        divisionWigets.add(Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
              color: const Color(0xff336600),
              borderRadius: BorderRadius.circular(10)),
        ));
      }
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanUpdate: (details) {
        value = widget.min +
            (details.localPosition.dx /
                    (MediaQuery.of(context).size.width - 60)) *
                (widget.max - widget.min);
        widget.onChanged(value);

        setState(() {
          showLabel = true;
        });
      },
      onPanEnd: (details) {
        computeValue();
        widget.onChanged(value);
        Future.delayed(const Duration(milliseconds: 1200), () {
          setState(() {
            showLabel = false;
          });
        });
      },
      child: Stack(
        key: globalKey,
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width - 60,
            height: 2,
            color: const Color(0xff000000),
          ),
          widget.divisions != null
              ? Positioned(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(15, 12, 15, 12),
                    width: MediaQuery.of(context).size.width - 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: divisionWigets,
                    ),
                  ),
                )
              : Positioned(left: 0, top: 0, child: Container()),
          (showLabel && widget.label != null && widget.showLabel)
              ? Positioned(
                  top: -40,
                  left: (value - widget.min) /
                      (widget.max - widget.min) *
                      (MediaQuery.of(context).size.width - 60),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: const Color(0xff336600),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          widget.label!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 2,
                        height: 10,
                        color: const Color(0xff336600),
                      )
                    ],
                  ),
                )
              : Positioned(left: 0, top: 0, child: Container()),
          Positioned(
              left: (value - widget.min) /
                  (widget.max - widget.min) *
                  (MediaQuery.of(context).size.width - 60),
              top: 0,
              child: Image.asset(
                "assets/images/pacman.png",
                width: 30,
                height: 30,
              ))
        ],
      ),
    );
  }
}

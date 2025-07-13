import 'package:flutter/material.dart';
import 'package:investment_app/core/constants/colors.dart';
import 'package:investment_app/core/utils/colors_utils.dart';
import 'package:investment_app/core/utils/device_utils.dart';

class AnimatedGradientScaffold extends StatefulWidget {
  const AnimatedGradientScaffold({
    super.key,
    this.body,
    this.bottomNavigationBar,
    this.appBar,
    this.floatingActionButton,
    this.extendBodyBehindAppBar = false,
    this.extendBody = false,
    this.colors = const [AppColors.primary, AppColors.secondary],
    this.stops = const [0.05, 0.3],
  });

  @override
  State<AnimatedGradientScaffold> createState() =>
      _AnimatedGradientScaffoldState();

  final Widget? body;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final bool extendBodyBehindAppBar;
  final bool extendBody;
  final List<Color> colors;
  final List<double> stops;
}

class _AnimatedGradientScaffoldState extends State<AnimatedGradientScaffold>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );

    _topAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
        ),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
        ),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.bottomLeft,
          end: Alignment.topLeft,
        ),
        weight: 1,
      ),
    ]).animate(_controller);

    _bottomAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
        ),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.bottomLeft,
          end: Alignment.topLeft,
        ),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
        ),
        weight: 1,
      ),
    ]).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //* gradient background
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Container(
              width: DeviceUtils.getScreenWidth(),
              height: DeviceUtils.getScreenHeight(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: _topAlignmentAnimation.value,
                  end: _bottomAlignmentAnimation.value,
                  colors: List.generate(widget.colors.length, (index) {
                    return DeviceUtils.isDarkMode(context)
                        ? ColorsUtils.makeDarker(widget.colors[index])
                        : widget.colors[index];
                  }),
                  stops: List.generate(widget.stops.length, (index) {
                    return widget.stops[index];
                  }),
                ),
              ),
            );
          },
        ),
        //* Scaffold Content
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: widget.appBar,
          body: widget.body,
          floatingActionButton: widget.floatingActionButton,
          extendBody: widget.extendBody,
          extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
          bottomNavigationBar: widget.bottomNavigationBar,
        ),
      ],
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

class TikTokLoadingAnimation extends StatefulWidget {
  @override
  _TikTokLoadingAnimationState createState() => _TikTokLoadingAnimationState();
}

class _TikTokLoadingAnimationState extends State<TikTokLoadingAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animationTranslateForward;

  late Animation<double> _animationGrowForward;

  late Animation<double> _animationReduceForward;

  late Animation<double> _animationTranslateBackward;

  late Animation<double> _animationGrowBackward;

  late Animation<double> _animationReduceBackward;

  late Animation<double> _translateInnerBall;

  late StreamController<bool> _innerBallStreamController;

  Sink<bool> get _innerBallSink => _innerBallStreamController.sink;

  Stream<bool> get _innerBallStream => _innerBallStreamController.stream;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 375),
    );

    _animationTranslateForward = Tween(begin: 0.0, end: 25.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    //That one works the first half of the time.
    _animationGrowForward = Tween(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.50, curve: Curves.easeInOut),
      ),
    );

    //And that one the second half.
    _animationReduceForward = Tween(begin: 1.05, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.50, 1.0, curve: Curves.easeInOut),
      ),
    );

    _animationTranslateBackward = Tween(begin: 25.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    //That one works the first half of the time.
    _animationGrowBackward = Tween(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.50, curve: Curves.easeInOut),
      ),
    );

    //And that one the second half.
    _animationReduceBackward = Tween(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.50, 1.0, curve: Curves.easeInOut),
      ),
    );

    _translateInnerBall = Tween(begin: 20.0, end: -40.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _innerBallStreamController = StreamController.broadcast();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _innerBallStreamController.close();

    super.dispose();
  }

  //We are gonna use the Flow widget, it allows us to define
  //the rules of laying out the children through its delegate.

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var _innerBall = ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: AnimatedBuilder(
        animation: _translateInnerBall,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(_translateInnerBall.value, 0.0),
            child: child,
          );
        },
        child: Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF252525),
          ),
        ),
      ),
    );

    return Flow(

      delegate: TikTokLoadingAnimationDelegate(
        animationController: _animationController,
        animationTranslateForward: _animationTranslateForward,
        animationGrowForward: _animationGrowForward,
        animationReduceForward: _animationReduceForward,
        animationTranslateBackward: _animationTranslateBackward,
        animationGrowBackward: _animationGrowBackward,
        animationReduceBackward: _animationReduceBackward,
        innerBallSink: _innerBallSink,
        size:size,
      ),
      children: [
        //The first ball.
        Container(
          alignment: Alignment.center,
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF37ffec),
          ),
          child: StreamBuilder(
            initialData: true,
            stream: _innerBallStream,
            builder: (context, snapshot) {
              return Visibility(
                visible: snapshot.data!,
                child: _innerBall,
              );
            },
          ),
        ),
        //The second ball.
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFf21458),
          ),
          child: StreamBuilder(
            initialData: true,
            stream: _innerBallStream,
            builder: (context, snapshot) {
              return Visibility(
                visible: !snapshot.data!,
                child: _innerBall,
              );
            },
          ),
        ),
      ],
    );
  }
}

class TikTokLoadingAnimationDelegate extends FlowDelegate {
  final AnimationController animationController;

  final Animation<double> animationTranslateForward;
  final Animation<double> animationGrowForward;
  final Animation<double> animationReduceForward;

  final Animation<double> animationTranslateBackward;
  final Animation<double> animationGrowBackward;
  final Animation<double> animationReduceBackward;

  int firstBallIndex = 0;
  int secondBallIndex = 1;

  final Sink<bool> innerBallSink;

  bool showInnerBallOnForwardBall = true;
  final Size size;
  TikTokLoadingAnimationDelegate({
    required this.animationController,
    required this.animationTranslateForward,
    required this.animationGrowForward,
    required this.animationReduceForward,
    required this.animationTranslateBackward,
    required this.animationGrowBackward,
    required this.animationReduceBackward,
    required this.innerBallSink,
    required this.size,
  }) : super(repaint: animationController) {
    animationController.forward();

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.value = 0.0;
        animationController.animateTo(1.0);

        _reverseChildren();
        _showInnerBallOnForwardBall();
      }
    });
  }

  _reverseChildren() {
    var tmp = firstBallIndex;
    firstBallIndex = secondBallIndex;
    secondBallIndex = tmp;
  }

  _showInnerBallOnForwardBall() {
    innerBallSink.add(showInnerBallOnForwardBall);
    showInnerBallOnForwardBall = !showInnerBallOnForwardBall;
  }

  //With that method we are gonna paint the children.
  @override
  void paintChildren(FlowPaintingContext context) {
    //Painting the first child.
    context.paintChild(
      firstBallIndex,
      transform: Matrix4.identity()
        ..translate(animationTranslateBackward.value+size.width/2-20,size.height/2)
        ..scale(animationGrowBackward.value)
        ..scale(animationReduceBackward.value),
    );

    //Painting the second child.
    context.paintChild(
      secondBallIndex,
      transform: Matrix4.identity()
        ..translate(animationTranslateForward.value+size.width/2-20,size.height/2)
        ..scale(animationGrowForward.value)
        ..scale(animationReduceForward.value),
    );
  }

  //That method is made to notify the Flow widget about
  //repainting the children.
  //But we are never gonna use it, because we've gave that mission
  //(of notifying the Flow widget) to the animationController.
  //Whenever its animation values changes, it's gonna notify the
  //Flow widget.

  @override
  bool shouldRepaint(TikTokLoadingAnimationDelegate oldDelegate) {
    return false;
  }
}
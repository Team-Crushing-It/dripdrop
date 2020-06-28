import 'dart:math' as math;

import 'package:flutter/material.dart';

class CustomGuitarDrawer extends StatefulWidget {
  final Widget child;
  final PageController controller;

  const CustomGuitarDrawer({
    Key key,
    this.child,
    this.controller,
  }) : super(key: key);

  static CustomGuitarDrawerState of(BuildContext context) =>
      context.findAncestorStateOfType<CustomGuitarDrawerState>();

  @override
  CustomGuitarDrawerState createState() => new CustomGuitarDrawerState();
}

class CustomGuitarDrawerState extends State<CustomGuitarDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  bool _canBeDragged = false;
  final double maxSlide = 300.0;

  bool drawer = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      behavior: HitTestBehavior.translucent,
      onTap: toggle,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return Container(
            // color: Colors.white,
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(maxSlide * (animationController.value - 1), 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.00)
                      ..rotateY(math.pi / 2 * (1 - animationController.value)),
                    alignment: Alignment.centerRight,
                    child: MyDrawer(),
                  ),
                ),



                Transform.translate(
                  offset: Offset(maxSlide * animationController.value, 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(-math.pi * animationController.value / 2),
                    alignment: Alignment.centerLeft,
                    child: widget.child,
                  ),
                ),

                // This is the place where the navbar would ideally fly

                // Positioned(
                //   top: 4.0 + MediaQuery.of(context).padding.top,
                //   left: 4.0 + animationController.value * maxSlide,
                //   child: IconButton(
                //     icon: Icon(Icons.menu),
                //     onPressed: toggle,
                //     color: Theme.of(context).primaryColorDark,
                //   ),
                // ),
                // Positioned(
                //   top: 16.0 + MediaQuery.of(context).padding.top,
                //   left: animationController.value *
                //       MediaQuery.of(context).size.width,
                //   width: MediaQuery.of(context).size.width,
                //   child: Text(
                //     'Hello Flutter',
                //     style: Theme.of(context).primaryTextTheme.title,
                //     textAlign: TextAlign.center,
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = animationController.isDismissed;
    bool isDragCloseFromRight = animationController.isCompleted;
    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;

    if (animationController.isDismissed) {
     // print('drawer false');
      drawer = false;
    }
    else {
      drawer = true;
     // print('drawer true');
    }

    // print('openfromleft: ' + isDragOpenFromLeft.toString());

    // print('closefromright: ' + isDragCloseFromRight.toString());

    // if (animationController.isCompleted) {
    //   if (animationController.isDismissed) {
    //     print('is Completed and dismissed');
    //   }

    //   // print(details);
    // }
  }

//==============================================================================================
  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / maxSlide;
      animationController.value += delta;
    }

    if (details.primaryDelta < -1) {
     // print('left');
      if (animationController.isDismissed && !drawer) {
        widget.controller.animateToPage(1,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      }
    } else if (details.primaryDelta > 1) {
      // print(details.primaryDelta);
      // drawer = false;
    }

    // if (details.delta.dx > 0)
    //   print("Dragging in +X direction");
    // else
    //   print("Dragging in -X direction");
  }

  void _onDragEnd(DragEndDetails details) {
    //I have no idea what it means, copied from Drawer

    //print('end: ' + details.toString());
    //print('animationController.value ' + animationController.value.toString());

    //AnimationController.value is controlling whether to open or close
    // depending if you have gone more than 50% of the screen

    double _kMinFlingVelocity = 365.0;

    //if the drawer is closed and you swipe the other direction================================
    if (animationController.isCompleted) {
      // print('Completed: ' + animationController.isCompleted.toString());
      // drawer = true;
      return;
    }

    if (animationController.isDismissed) {
      // print('dismissed');
      // print('upperbound ' + animationController.upperBound.toString());
      // if (drawer) {
      //   widget.controller.animateToPage(1,
      //       duration: Duration(milliseconds: 500), curve: Curves.ease);
      //   drawer = false;
      // }

      return;
    }

    if (animationController.isDismissed && animationController.isCompleted) {
      // print('swiping');
      // widget.controller.animateToPage(1,
      //     duration: Duration(milliseconds: 500), curve: Curves.ease);
      return;
    }

    //if the velocity of the drag is greater then the minimum, fling that baby open!

    if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      animationController.fling(velocity: visualVelocity);
      // print('fling');
      // print(visualVelocity.toString());

      // if (visualVelocity < 1) {
      //   print('fling close');
      //   drawer = false;
      // }

      // if (visualVelocity > 1) {
      //   print('fling open');
      //   drawer = true;
      // }

      //These animate back to postion if the fling wasn't enough
    } else if (animationController.value < 0.5) {
      animationController.reverse();
      // print('reverse');

      // call drawer false

      drawer = false;
    } else {
      animationController.forward();
      // print('forward');
    }
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: double.infinity,
      child: Material(
        color: Theme.of(context).accentColor,
        child: SafeArea(
          child: Theme(
            data: ThemeData(brightness: Brightness.dark),
            child: Padding(
              padding: const EdgeInsets.only(right: 65),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("/home-button.png"),
                  Image.asset("/bdbd-button.png"),
                  Image.asset("/relive-button.png"),
                  Image.asset("/button_instaplant.png"),
                  Image.asset("/ccare-button.png"),
                  Image.asset("/report-button.png"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class DropPage extends StatefulWidget {
  // static String routeName = '/misc/card_swipe';

  @override
  _DropPageState createState() => _DropPageState();
}

class _DropPageState extends State<DropPage> {
  List<String> fileNames;

  @override
  void initState() {
    super.initState();
    _resetCards();
  }

  void _resetCards() {
    fileNames = [
      'assets/iconjpg',
      'assets/icon.jpg',
      'assets/iconjpg',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Swipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ClipRect(
                  child: Stack(
                    overflow: Overflow.clip,
                    children: <Widget>[
                      for (final fileName in fileNames)
                        SwipeableCard(
                          imageAssetName: fileName,
                          onSwiped: () {
                            setState(() {
                              fileNames.remove(fileName);
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ),
              RaisedButton(
                child: const Text('Refill'),
                onPressed: () {
                  setState(() {
                    _resetCards();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String imageAssetName;

  Card(this.imageAssetName);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 5,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: AssetImage(imageAssetName),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class SwipeableCard extends StatefulWidget {
  final String imageAssetName;
  final VoidCallback onSwiped;

  SwipeableCard({
    this.onSwiped,
    this.imageAssetName,
  });

  @override
  _SwipeableCardState createState() => _SwipeableCardState();
}

class _SwipeableCardState extends State<SwipeableCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;
  double _dragStartX;
  bool _isSwipingLeft = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);
    _animation = _controller.drive(Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1, 0),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: GestureDetector(
        onHorizontalDragStart: _dragStart,
        onHorizontalDragUpdate: _dragUpdate,
        onHorizontalDragEnd: _dragEnd,
        child: Card(widget.imageAssetName),
      ),
    );
  }

  /// Sets the starting position the user dragged from.
  void _dragStart(DragStartDetails details) {
    _dragStartX = details.localPosition.dx;
  }

  /// Changes the animation to animate to the left or right depending on the
  /// swipe, and sets the AnimationController's value to the swiped amount.
  void _dragUpdate(DragUpdateDetails details) {
    var isSwipingLeft = (details.localPosition.dx - _dragStartX) < 0;
    if (isSwipingLeft != _isSwipingLeft) {
      _isSwipingLeft = isSwipingLeft;
      _updateAnimation(details.localPosition.dx);
    }

    setState(() {
      // Calculate the amount dragged in unit coordinates (between 0 and 1)
      // using this widgets width.
      _controller.value =
          (details.localPosition.dx - _dragStartX).abs() / context.size.width;
    });
  }

  /// Runs the fling / spring animation using the final velocity of the drag
  /// gesture.
  void _dragEnd(DragEndDetails details) {
    var velocity =
        (details.velocity.pixelsPerSecond.dx / context.size.width).abs();
    _animate(velocity: velocity);
  }

  void _updateAnimation(double dragPosition) {
    _animation = _controller.drive(Tween<Offset>(
      begin: Offset.zero,
      end: _isSwipingLeft ? Offset(-1, 0) : Offset(1, 0),
    ));
  }

  void _animate({double velocity = 0}) {
    var description = SpringDescription(mass: 50, stiffness: 1, damping: 1);
    var simulation =
        SpringSimulation(description, _controller.value, 1, velocity);
    _controller.animateWith(simulation).then<void>((_) {
      widget.onSwiped();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

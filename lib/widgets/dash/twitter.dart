import 'package:flutter/material.dart';

class Twitter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          width: 250,
          height: 200,
          //Insert goodies here
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                color: Theme.of(context).accentColor,
                child: Text(
                  "LOCAL NEWS",
                  style:
                      TextStyle(fontFamily: "Software Tester 7", fontSize: 25),
                ),
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).accentColor, width: 5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 5),
                                  margin: const EdgeInsets.only(top: 20.0),
                                  width: 50,
                                  height: 50,
                                  //Insert goodies here
                                  child: Image(
                                      image: AssetImage("assets/avatar.png")),
                                ),
                                Container(
                                  width: 90,
                                  height: 50,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "CBS News",
                                        style: TextStyle(
                                            fontFamily: "Corp Trial",
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).accentColor,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        "@CBSNews",
                                        style: TextStyle(
                                            fontFamily: "Corp Trial",
                                            color:
                                                Theme.of(context).accentColor,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      height: 30,
                                      width: 30,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/twitter.png"))),
                                ),
                              ]),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "Whole Food and Amazon selling water with “concerning” levels of arsenic",
                            style: TextStyle(
                                fontFamily: "Corp Trial",
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor,
                                fontSize: 14),
                          ),
                        ),
                        Text(
                          "https://t.co/JnfR08iUPu?amp=1",
                          style: TextStyle(
                              fontFamily: "Corp Trial",
                              color: Theme.of(context).accentColor,
                              fontSize: 14),
                        ),
                      ],
                    )

                    // Text("TWITTER PLACEHOLDER", style: TextStyle(color: Theme.of(context).accentColor),),
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

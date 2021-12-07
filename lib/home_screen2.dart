import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  double columnThickness = 0.05;
  String title = 'Daily Water Intake';
  String desc = 'week avg';
  String units = 'cups';
  String detailsTitle = 'Cups';
  double minValue = 0.0;
  double maxValue = 10.0;
  double splashOffsetX = 0.25;
  double splashOffsetY = -0.75;
  double shadowOffsetX = 0;
  double shadowOffsetY = 0;
  Color titleColor = Colors.white;
  Color descColor = Colors.white.withOpacity(0.7);
  Color unitsColor = Colors.white;
  Color columnColor = Colors.white;
  Color mainColor = Colors.indigoAccent;
  Color shadowColor = Colors.indigo[600];
  Color splashColor = Colors.lightBlueAccent;
  double shadowBlurRadius = 8.0;
  List myList = [5];

  // user not change
  bool popup = false;
  var detailsData;
  var avg = 0.0;
  // user not change

  List<Widget> myLogic() {
    List<Widget> myChildren = [];
    List subList;
    myList.length < 8
        ? subList = myList
        : subList = myList.sublist(myList.length - 7, myList.length);
    subList.forEach((element) {
      myChildren.add(
        Expanded(
          child: GestureDetector(
            onTap: () {
              print('POP');
              setState(() {
                detailsData = element;
                popup = true;
              });
            },
            child: Container(
              color: Colors.transparent,
              child: FractionallySizedBox(
                heightFactor: element / (maxValue + minValue),
                widthFactor:
                    myList.length < 8 ? columnThickness * myList.length : columnThickness * 7,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: columnColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
    return myChildren;
  }

  void findAvg() {
    List subList;
    var sum = 0.0;
    var timesCycled = 0.0;
    myList.length < 8
        ? subList = myList
        : subList = myList.sublist(myList.length - 7, myList.length);
    for (var e in subList) {
      timesCycled++;
      sum += e;
    }
    avg = sum / timesCycled;
  }

  @override
  Widget build(BuildContext context) {
    findAvg();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            setState(() {
              myList.add(2);
            });
          }),
      body: Center(
        child: Container(
          width: 145,
          height: 190,
          child: GestureDetector(
            onTap: () {
              setState(() {
                popup = false;
              });
            },
            child: AspectRatio(
              aspectRatio: 29 / 38,
              child: Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: shadowBlurRadius,
                      color: shadowColor,
                      offset: Offset(shadowOffsetX, shadowOffsetY),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        child: LayoutBuilder(
                            builder: (context, constraints) => Transform.translate(
                                  offset: Offset(constraints.maxHeight * splashOffsetX,
                                      constraints.maxWidth * splashOffsetY),
                                  child: Container(
                                    decoration:
                                        BoxDecoration(color: splashColor, shape: BoxShape.circle),
                                  ),
                                ))),
                    Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: FractionallySizedBox(
                            child: Container(
                              child: FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.contain,
                                child: Container(
                                  child: Text(
                                    title,
                                    style: TextStyle(
                                      fontFamily: 'Ub',
                                      color: titleColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            heightFactor: 0.5,
                            widthFactor: 0.85,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: FractionallySizedBox(
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: myLogic(),
                              ),
                            ),
                            heightFactor: 0.9,
                            widthFactor: 0.95,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FractionallySizedBox(
                            child: Container(
                              child: FittedBox(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.contain,
                                child: Container(
                                  child: RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '${avg.toStringAsFixed(2)} $units',
                                            style: TextStyle(
                                                fontFamily: 'Ub',
                                                color: unitsColor,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: '  ',
                                            style: TextStyle(
                                              fontFamily: 'Ub',
                                              color: Colors.white,
                                            )),
                                        TextSpan(
                                            text: desc,
                                            style: TextStyle(
                                              fontFamily: 'Ub',
                                              color: descColor,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            heightFactor: 0.4,
                            widthFactor: 0.85,
                          ),
                        ),
                      ],
                    ),
                    popup == true
                        ? FractionallySizedBox(
                            heightFactor: 0.3,
                            widthFactor: 0.5,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent.withOpacity(0.8),
                                  borderRadius: BorderRadius.all(Radius.circular(15))),
                              child: FractionallySizedBox(
                                heightFactor: 0.8,
                                widthFactor: 0.8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        child: FittedBox(
                                          alignment: Alignment.center,
                                          fit: BoxFit.contain,
                                          child: Container(
                                            child: Text(
                                              detailsTitle,
                                              style: TextStyle(
                                                fontFamily: 'Ub',
                                                color: titleColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: FittedBox(
                                          alignment: Alignment.center,
                                          fit: BoxFit.contain,
                                          child: Container(
                                            child: Text(
                                              '$detailsData',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Ub',
                                                color: titleColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

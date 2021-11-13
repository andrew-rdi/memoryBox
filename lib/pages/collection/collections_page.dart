import 'package:flutter/material.dart';
import 'package:memorybox/resources/app_colors.dart';
import 'package:memorybox/widgets/custom_paint/collection_shape.dart';

class Collections extends StatefulWidget {
  const Collections({Key? key}) : super(key: key);

  @override
  _CollectionsgState createState() => _CollectionsgState();
}

class _CollectionsgState extends State<Collections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: CurvePainterCollection(),
        child: Stack(
          children: <Widget>[
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Подборки',
                      style: TextStyle(
                        color: background,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Все в одном месте',
                    style: TextStyle(
                      color: background,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            CustomScrollView(
              anchor: 0.25,
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: background.withOpacity(0.0),
                    ),
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    //height: 1000,
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              color: black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {
                                  print('Card tapped.');
                                },
                                child: const SizedBox(
                                  width: 150,
                                  height: 200,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          'name',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              color: black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {
                                  print('Card tapped.');
                                },
                                child: const SizedBox(
                                  width: 150,
                                  height: 200,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          'name',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              color: black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {
                                  print('Card tapped.');
                                },
                                child: const SizedBox(
                                  width: 150,
                                  height: 200,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          'name',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              color: black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {
                                  print('Card tapped.');
                                },
                                child: const SizedBox(
                                  width: 150,
                                  height: 200,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          'name',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              color: black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {
                                  print('Card tapped.');
                                },
                                child: const SizedBox(
                                  width: 150,
                                  height: 200,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          'name',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              color: black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {
                                  print('Card tapped.');
                                },
                                child: const SizedBox(
                                  width: 150,
                                  height: 200,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          'name',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

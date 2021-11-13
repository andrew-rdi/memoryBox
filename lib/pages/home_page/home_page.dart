import 'package:flutter/material.dart';
import 'package:memorybox/resources/app_colors.dart';
import 'package:memorybox/widgets/custom_paint/main_shape.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: CurvePainter(),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 80, right: 20, left: 20, bottom: 5),
                  child: Row(
                    children: const [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Подборки',
                          style: TextStyle(
                            color: background,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Открыть все',
                          //textAlign: TextAlign.left,
                          style: TextStyle(
                            color: background,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Card(
                        color: green.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(
                          splashColor: green,
                          onTap: () {
                            print('Card tapped.');
                          },
                          child: const SizedBox(
                            width: 150,
                            height: 200,
                            child: Center(
                              child: Center(
                                child: Text(
                                  'Здесь будет\n'
                                  'твой набор\n'
                                  'сказок',
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
                      Column(
                        children: [
                          Card(
                            color: rose.withOpacity(0.8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: InkWell(
                              splashColor: rose,
                              onTap: () {
                                print('Card tapped.');
                              },
                              child: const SizedBox(
                                width: 150,
                                height: 95,
                                child: Center(
                                  child: Text('Тут'),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            color: blue.withOpacity(0.8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: InkWell(
                              splashColor: blue,
                              onTap: () {
                                print('Card tapped.');
                              },
                              child: const SizedBox(
                                width: 150,
                                height: 95,
                                child: Center(
                                  child: Text('И тут'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomScrollView(
              anchor: 0.55,
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 8.0,
                        )
                      ],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: background,
                    ),
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    height: 500,
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: const [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Аудиозаписи',
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Открыть все',
                                  //textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

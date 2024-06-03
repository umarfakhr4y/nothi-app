import 'package:flutter/material.dart';

class trackRecordPage extends StatefulWidget {
  const trackRecordPage({super.key});

  @override
  State<trackRecordPage> createState() => _trackRecordPageState();
}

class _trackRecordPageState extends State<trackRecordPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff994C4C),
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          tabs: [
            Tab(text: 'Week'),
            Tab(text: 'Month'),
            Tab(text: 'All Time'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomePage(
            cal: '0',
            sleep: '12',
            wake: '48',
            water: '62',
          ),
          HomePage(
            cal: '120',
            sleep: '54',
            wake: '247',
            water: '297',
          ),
          HomePage(
            cal: '250',
            sleep: '666',
            wake: '599',
            water: '3457',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.cal,
    required this.water,
    required this.wake,
    required this.sleep,
  });

  final String cal;
  final String water;
  final String wake;
  final String sleep;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffFFF1F1),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 3, offset: Offset(0, 2), spreadRadius: 0.1)
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 1,
                  ),
                  Text(
                    'Calories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(
                    width: 99,
                  ),
                  Row(
                    children: [
                      Text(
                        '$cal Kcal',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Image.asset('assets/images/emot_api.png')
                    ],
                  ),
                  SizedBox(
                    width: 1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Color(0xffFFF1F1),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 3, offset: Offset(0, 2), spreadRadius: 0.1)
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/emot_smile.png'),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Calories',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Image.asset(
                    'assets/images/slider_emot.png',
                    scale: 0.9,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 200,
                  width: 210,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Color(0xffFFF1F1),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            offset: Offset(0, 2),
                            spreadRadius: 0.1)
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/emot_air.png'),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Water',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '$water L  ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Image.asset(
                            'assets/images/grafik_water.png',
                            scale: 0.8,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: 150,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Color(0xffFFF1F1),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            offset: Offset(0, 2),
                            spreadRadius: 0.1)
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sleep',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Wake Time:\n$wake H',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 18),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Sleep Time:\n$sleep H',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Color(0xffFFF1F1),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 3, offset: Offset(0, 2), spreadRadius: 0.1)
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Quotes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

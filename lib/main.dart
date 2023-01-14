import 'package:flutter/material.dart';
import 'package:test6/class_list_food.dart';
import 'package:test6/class_test.dart';
import 'package:test6/food_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:test6/mycard.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = 'TH';
  ListFood food = ListFood(nama: '', desc: '', image: '', price: 0, flav: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              //Navigator.of(context).pushReplacement(MaterialPageRoute(
              //   builder: (BuildContext context) => MyApp()));
            },
          ),
          Align(
              alignment: Alignment.center,
              child: DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['TH', 'EN', 'CN', 'TW']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
        ],
        title:
            const Text("อาหารภาคเหนือ", style: TextStyle(fontFamily: 'Mitr')),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Popular",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Mitr',
                      ),
                    ),
                    IconButton(
                        icon: Image.asset(
                          "assets/images/filter.png",
                          width: 22,
                        ),
                        onPressed: () {})
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15),
                margin: const EdgeInsets.only(bottom: 10),
                height: 315,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                   final food = foodList1[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailFood(food: food);
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(right: 15, left: 0),
                        width: 225,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: const Color(0xffFBCEDC),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  food.image,
                                  width: 150,
                                  height: 130,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      food.nama,
                                      style: const TextStyle(
                                        fontFamily: 'Mitr',
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      food.flav,
                                      style: const TextStyle(
                                        fontFamily: 'Mitr',
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "\$" + food.price.toString(),
                                      style: const TextStyle(
                                        fontFamily: 'Mitr',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "New in",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Mitr',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        
                        print(Food().nama);
                        //print(Beverage().nama);
                      },
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          color: Color(0xffFF5F99),
                        ),
                      ),
                    )
                  ],
                ),
              ),
             // MyCard(yourData: food)

              /*Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: foodList.length,
                  itemBuilder: (context, index) {
                    final ListFood food = foodList[index];
                    final ListFood beverage = foodList[index];
                    final ListFood dessert = foodList[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(bottom: 13),
                              decoration: BoxDecoration(
                                color: const Color(0xffFBCEDC),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                  child: Image.asset(foodList[index].image)),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      foodList[index].nama,
                                      style: const TextStyle(
                                        fontFamily: 'Mitr',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "\$" + foodList[index].price.toString(),
                                    style: const TextStyle(
                                      fontFamily: 'Mitr',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const FavB(),
                      ],
                    );
                  },
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

class FavB extends StatefulWidget {
  const FavB({Key? key}) : super(key: key);

  @override
  State<FavB> createState() => _FavBState();
}

class _FavBState extends State<FavB> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFav = !isFav;
        });
      },
      icon: Icon(
        isFav ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
        color: const Color(0xffFF5F99),
        size: 24.0,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test6/class_list_food.dart';


class MyCard1 extends StatefulWidget {
  final ListFood yourData;
  
  const MyCard1(
      {Key? key,
      required this.yourData,
      
      })
      : super(key: key);
  factory MyCard1.ListFood(yourData)=>MyCard1(yourData: yourData);
    
  
  @override
  State<MyCard1> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: ListView.builder(
        shrinkWrap: true,
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: foodList1.length,
        itemBuilder: (context, index) {
          
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
                    child: Center(child: Image.asset(foodList1[index].image)),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            foodList1[index].nama,
                            style: const TextStyle(
                              fontFamily: 'Mitr',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          "\$" + foodList1[index].price.toString(),
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
            ],
          );
        },
      ),
    );
  }
}

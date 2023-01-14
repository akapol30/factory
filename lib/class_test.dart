class MyCard{
  String name= 'ร้านอาหาร';
  
  MyCard();
 factory MyCard.Food()=> MyCard();
}
class Food extends MyCard{
  @override
  String name ='อาหาร';
  
  late String nama;
  late String desc;
  late String image;
  late String flav;
  late double price;

  Food(
      {nama,
      desc,
      image,
      price,
      flav});

  var foodList = [
  Food(
    nama: 'Fraise Cream',
    desc:
        'We have been loading up on the stone fruit and berries at the market. We have no self control to these summer gems. We have gross we can out of hand, our  Strawberry...',
    price: 2.50,
    image: 'assets/images/food1.png',
    flav: 'Strawberry Flovour Sweet Ice Cream',
  ),
  Food(
    nama: 'Mandarine',
    desc:
        'We have been loading up on the stone fruit and berries at the market. We have no self control to these summer gems. We have gross we can out of hand, our  Strawberry...',
    price: 3.50,
    image: 'assets/images/food2.png',
    flav: 'Caramel Flovour Sweet Ice Cream',
  )
  ];
}

class Beverage extends MyCard{
  @override
  String name = 'เครื่องดื่ม';
  late String nama;
  late String desc;
  late String image;
  late String flav;
  late double price;
  Beverage(
      {nama,
      desc,
      image,
      price,
      flav});

  var beverageList = [
  Beverage(
    nama: 'test',
    desc:
        'We have test',
    image: 'assets/images/food1.png',
    flav: 'Strawberry test',
  ),
  ];
}
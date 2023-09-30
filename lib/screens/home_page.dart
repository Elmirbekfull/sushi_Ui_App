import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/components/category.sushi.dart';
import 'package:sushi_app/models/shop.dart';

import 'package:sushi_app/screens/my_cart.dart';
import 'package:sushi_app/screens/sushi_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // menu sushi

  // List sushiMenu = [
  //   SushiModels("Салмон Суши", "10.00", "assets/images/1.png", "4.5"),
  //   SushiModels("Туна Суши", "21.00", "assets/images/2.png", "7.0"),
  //   SushiModels("Суши с угрем", "15.00", "assets/images/3.png", "8.3"),
  // ];

  void navigatorSushiDetail(int index) {
    // get the shop and its menu
    final shop = context.read<Shop>();
    final foodMenu = shop.shopMenu;

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SushiDetail(
              food: foodMenu[index],
            )));
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.shopMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.place,
                color: Colors.red,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Бишкек",
                style: TextStyle(color: Colors.grey[900]),
              ),
            ],
          ),
        ),
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
          size: 30,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyCart()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(211, 102, 81, 79)),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 138, 60, 55),
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Получи 32% скидку",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Button(
                      text: "Выкупать",
                      onTap: () {},
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/main.png",
                  height: 130,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "поиск....",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Text(
              "Меню Суши",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // popular sushi
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodMenu.length,
                  itemBuilder: (context, index) {
                    return CategorySushi(
                      food: foodMenu[index],
                      onTap: () {
                        setState(() {
                          navigatorSushiDetail(index);
                        });
                      },
                    );
                  })),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Text(
              "Популярные",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/category.png",
                      height: 80,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name
                        const Text(
                          "Выгодный",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // price
                        Text(
                          "\$7.95",
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    )
                  ],
                ),
                const Icon(
                  Icons.favorite_outline,
                  size: 30,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

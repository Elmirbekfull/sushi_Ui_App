import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/models/sushiModels.dart';
import 'package:sushi_app/screens/my_cart.dart';

class SushiDetail extends StatefulWidget {
  final SushiModels food;
  const SushiDetail({super.key, required this.food});

  @override
  State<SushiDetail> createState() => _SushiDetailState();
}

class _SushiDetailState extends State<SushiDetail> {
  int _counter = 0;
  void plus() {
    setState(() {
      _counter++;
    });
  }

  void minus() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void addToCartSushi() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MyCart()));
  }

  // add to cart

  void addToCart() {
    // добавлять что то в корзину
    if (_counter > 0) {
      // получить доступ к магазину
      final shop = context.read<Shop>();
      // добавить его в корзину
      shop.addToCart(widget.food, _counter);

      // сообшение пользоветелю что все прошло
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: const Color.fromARGB(255, 138, 60, 55),
                content: const Text(
                  "Успешно добавлено",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.done,
                        color: Colors.green,
                        size: 30,
                      ))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              Image.asset(
                widget.food.imagePath,
                height: 250,
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // name sushi
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  widget.food.name,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // descrition
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  "Описание",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  "Свежие ингредиенты: Мы используем только самые свежие и высококачественные продукты, чтобы гарантировать вам неповторимый вкус в каждом кусочке суши.\nМножество вариаций: Наше разнообразное меню включает в себя классические роллы, авторские креации и сезонные специальности. У нас есть суши для каждого вкуса.",
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 15, height: 2),
                ),
              ),
            ],
          )),
          Container(
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 138, 60, 55),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // price
                    Text(
                      "\$" + widget.food.price,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Row(
                      children: [
                        // minus
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(212, 135, 81, 77),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  minus();
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              )),
                        ),
                        // things
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              _counter.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        // plus
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(212, 135, 81, 77),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  plus();
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                // add to basked
                Button(
                  text: "Добавить в корзину",
                  onTap: addToCart,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

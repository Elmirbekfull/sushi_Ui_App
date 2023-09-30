import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/models/sushiModels.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  // remove from cart
  void removeFromCart(SushiModels sushi, BuildContext context) {
    // получить доступ к магазин
    final shop = context.read<Shop>();
    // удалить продукт из корзиеы
    shop.removeFromCart(sushi);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 138, 60, 55),
        appBar: AppBar(
            title: const Text(
              "Мои корзины",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color.fromARGB(255, 138, 60, 55),
            foregroundColor: Colors.white),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    // достать еду из телешки
                    final SushiModels sushi = value.cart[index];

                    // получить название еды
                    String sushiName = sushi.name;
                    // получить цены
                    String sushiPrice = sushi.price;
                    // вернуть пользоветельский интерфейс
                    return Container(
                      margin: const EdgeInsets.only(
                          left: 25, right: 25, top: 20, bottom: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: const Color.fromARGB(212, 135, 81, 77),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40))),
                      child: ListTile(
                        title: Text(
                          sushiName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "\$" + sushiPrice,
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        trailing: IconButton(
                            onPressed: () => removeFromCart(sushi, context),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            )),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Button(text: "Заплатить сейчас", onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}

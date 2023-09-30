import 'package:flutter/material.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/screens/home_page.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Суши",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Image.asset("assets/images/logo.png"),
            ),
            const Text(
              "Обслуживание высшего класса",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 38),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Мы - команда профессиональных суши-мастеров, преданная искусству создания суши и роллов высшего качества.",
              style:
                  TextStyle(fontSize: 18, color: Colors.grey[200], height: 1),
            ),
            const SizedBox(
              height: 20,
            ),
            // button
            Button(
              text: "Закажите прямо сейчас",
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            )
          ],
        ),
      )),
    );
  }
}

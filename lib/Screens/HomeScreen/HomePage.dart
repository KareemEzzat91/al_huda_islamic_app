import 'package:al_huda_islamic_app/Tasks/JsonTask/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/Premium Vector _ Islamic 3d podium round stage for Eid Mubarak Ramadan Kareem Muharram Iftar on color background.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: height / 2),
            Center(
              child: Column(
                children: [
                  buildAnimatedButton("Json Task", context, Users()),
                  const SizedBox(height: 20),
                  buildAnimatedButton("القران الكريم", context),
                  const SizedBox(height: 20),
                  buildAnimatedButton("اذكار", context),
                  const SizedBox(height: 20),
                  buildAnimatedButton("القبلة", context),
                  const SizedBox(height: 20),
                  buildAnimatedButton("اوقات الصلاة", context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedButton buildAnimatedButton(String label, BuildContext context,
      [Widget? nextPage]) {
    return AnimatedButton(
      width: double.infinity,
      text: label,
      transitionType: TransitionType.BOTTOM_TO_TOP,
      textStyle: const TextStyle(
        fontSize: 28,
        letterSpacing: 5,
        fontWeight: FontWeight.w300,
      ),
      onPress: () {
        if (nextPage != null) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => nextPage,
          ));
        }
      },
    );
  }
}

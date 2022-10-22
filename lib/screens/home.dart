import 'package:flip_image_app/controllers/home_controller.dart';
import 'package:flip_image_app/screens/quotes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text("Quotes App",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: homeController.quoteCategories.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(QuotesScreen(
                          categoryName: homeController.quoteCategories[index]));
                    },
                    child: SizedBox(
                      height: 80,
                      child: Card(
                        child: Center(
                            child: Text(
                          homeController.quoteCategories[index],
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        )),
      ),
    );
  }
}

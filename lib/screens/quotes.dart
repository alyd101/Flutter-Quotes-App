import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_image_app/controllers/quotes.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_controller.dart';

class QuotesScreen extends StatefulWidget {
  final categoryName;
  const QuotesScreen({super.key, required this.categoryName});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  QuotesController quotesController = Get.put(QuotesController());
  @override
  void initState() {
    super.initState();
    quotesController.getQuotes(widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.keyboard_return, color: Colors.black),
        ),
        title: Center(
            child: Text(
          "${widget.categoryName} Quotes",
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: Center(
        child: Expanded(
          child: Obx(
            (() {
              return Visibility(
                  replacement: CircularProgressIndicator(),
                  visible: quotesController.dataLoaded.value,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      scrollDirection: Axis.vertical,
                      pageSnapping: true,
                      enlargeCenterPage: true,
                      height: MediaQuery.of(context).size.height,
                    ),
                    itemCount: quotesController.quotes.length,
                    itemBuilder: (context, index, realIndex) => Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              quotesController.quotes[index],
                              textAlign: TextAlign.center,
                            ),
                            const Padding(padding: EdgeInsets.only(top: 100)),
                            Text(
                              quotesController.authors[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
            }),
          ),
        ),
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class QuotesController extends GetxController {
  var dataLoaded = false.obs;
  List<String> quotes = [];
  List<String> authors = [];

  void getQuotes(String categoryName) async {
    final url = Uri.parse(
        "https://quotes.toscrape.com/tag/${categoryName.toLowerCase()}/");

    final response = await http.get(url);
    dom.Document document = parser.parse(response.body);
    final quotesClass = document.getElementsByClassName("quote");
    quotes = quotesClass
        .map((e) => e.getElementsByClassName("text")[0].innerHtml)
        .toList();
    authors = quotesClass
        .map((e) => e.getElementsByClassName("author")[0].innerHtml)
        .toList();
    dataLoaded.toggle();
  }
}

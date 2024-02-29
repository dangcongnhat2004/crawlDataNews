import 'dart:convert';

import 'package:crawldata/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b3125ed704d447c1803ef135f2ab99fe";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData != null && jsonData['status'] == "ok") {
      // Check if 'articles' is not null
      var articles = jsonData["articles"];
      if (articles != null) {
        articles.forEach((element) {
          if (element["urlToImage"] != null && element["description"] != null) {
            ArticleModel articleModel = ArticleModel(
              title: element['title'] ?? '',
              author: element['author'] ?? '',
              description: element['description'] ?? '',
              url: element['url'] ?? '',
              urlToImage: element['urlToImage'] ?? '',
              content: element["content"] ?? '',
            );
            news.add(articleModel);
          }
        });
      }
    }
  }
}


// class CategoryNewsClass {
//   List<ArticleModel> news = [];

//   Future<void> getNews(String category) async {
//     String url =
//         "https://newsapi.org/v2/top-headlines?category=in&category=$category&apiKey=b3125ed704d447c1803ef135f2ab99fe";
//     var response = await http.get(Uri.parse(url));
//     var jsonData = jsonDecode(response.body);
//     if (jsonData != null && jsonData['status'] == "ok") {
//       // Check if 'articles' is not null
//       var articles = jsonData["articles"];
//       if (articles != null) {
//         articles.forEach((element) {
//           if (element["urlToImage"] != null && element["description"] != null) {
//             ArticleModel articleModel = ArticleModel(
//               title: element['title'] ?? '',
//               author: element['author'] ?? '',
//               description: element['description'] ?? '',
//               url: element['url'] ?? '',
//               urlToImage: element['urlToImage'] ?? '',
//               content: element["content"] ?? '',
//             );
//             news.add(articleModel);
//           }
//         });
//       }
//     }
//   }
// }
class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?category=in&category=$category&apiKey=b3125ed704d447c1803ef135f2ab99fe";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData != null && jsonData['status'] == "ok") {
      // Check if 'articles' is not null
      var articles = jsonData["articles"];
      if (articles != null) {
        articles.forEach((element) {
          if (element["urlToImage"] != null && element["description"] != null) {
            ArticleModel articleModel = ArticleModel(
              title: element['title'] ?? '',
              author: element['author'] ?? '',
              description: element['description'] ?? '',
              url: element['url'] ?? '',
              urlToImage: element['urlToImage'] ?? '',
              content: element["content"] ?? '',
            );
            news.add(articleModel);
          }
        });
      }
    }
  }
}
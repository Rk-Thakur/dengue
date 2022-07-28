import 'package:dengue/model/news.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsProvider =
    StateNotifierProvider<NewsProvider, List<news>>((ref) => NewsProvider());

class NewsProvider extends StateNotifier<List<news>> {
  NewsProvider() : super([]) {
    getNews();
  }

  Future<void> getNews() async {
    final dio = Dio();

    try {
      final response =
          await dio.get('https://current-news.p.rapidapi.com/news/health',
              options: Options(headers: {
                'x-rapidapi-host': 'current-news.p.rapidapi.com',
                'x-rapidapi-key':
                    'e7db4f58a9msh38c61008b84e869p1960f1jsn61164c8d1a95'
              }));

      final data =
          (response.data['news'] as List).map((e) => news.fromJson(e)).toList();
      state = data;
      print(response.data['news']);
    } on DioError catch (e) {
      print(e.error);
    }
  }
}

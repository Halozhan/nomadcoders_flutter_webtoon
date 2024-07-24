import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_webtoon/models/webtoon_model.dart';
import 'package:nomadcoders_flutter_webtoon/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 2,
        backgroundColor: Colors.grey.shade300,
        foregroundColor: Colors.green[300],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: webtoons,
        builder:(context, snapshot) {
          if (snapshot.hasData) {
            return const Text("There is a data!");
          }
          return const Text("Loading...");
        },
      ),
    );
  }
}

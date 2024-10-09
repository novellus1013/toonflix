import 'package:flutter/material.dart';
import 'package:toonflix/services/api_service.dart';

import '../models/webtoon_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //appBar 표면에 적용되는 overlay 색상
        surfaceTintColor: Colors.white,
        //그림자 색상
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 03,
        centerTitle: true,
        title: const Text(
          "Today's 툰s",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text("There is data!!!");
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

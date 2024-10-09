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
            // return ListView(
            //   //리스트 컴프리헨션, 대괄호 안에 직접 표현식을 작성
            //   children: [
            //     for (var webtoon in snapshot.data!) Text(webtoon.title)
            //   ],
            // );
            // return ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   itemCount: snapshot.data!.length,
            //   itemBuilder: (context, index) {
            //     print(index);
            //     var webtoon = snapshot.data![index];
            //     return Text(webtoon.title);
            //   },
            // );
            //ListView.builder() 에 구분자 추가
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                print(index);
                var webtoon = snapshot.data![index];
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 20,
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.webtoonId,
    required this.episode,
  });

  final String webtoonId;
  final WebtoonEpisodeModel episode;

  onButtonTap() async {
    // final url = Uri.parse("https://google.com");
    // await launchUrl(url);
    final url =
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}";
    await launchUrlString(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20,
            ),
            color: Colors.white,
            border: Border.all(
              color: Colors.green.shade400,
            ),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5.0,
                color: Colors.lightBlue,
                offset: Offset(2, 2),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: TextStyle(
                  color: Colors.green.shade400,
                  fontSize: 16,
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.green.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

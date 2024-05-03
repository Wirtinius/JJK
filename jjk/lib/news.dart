import 'package:flutter/material.dart';
import 'news_detail_page.dart';

class News {
  final String title;
  final String summary;
  final String imageUrl;
  final String detail;

  News({
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.detail,
  });
}

List<News> newsList = [
  News(
    title: 'Jujutsu Kaisen Streaming Update',
    summary: 'Latest on Jujutsu Kaisen streaming availability in the US.',
    imageUrl: 'assets/crunchyroll.png',
    detail: 'Since the series premiere in 2020, Jujutsu Kaisen has been licensed for international streaming through Crunchyroll, which also produces the foreign language-dubs of the hit franchise. This licensing agreement has led Jujutsu Kaisen to appear on a variety of streaming platforms worldwide as audiences follow the show’s story telling of a long-standing secret war between sorcerers and evil curses. Here is the streaming status of Jujutsu Kaisen and the availability of its second season on Netflix, more specifically Netflix U.S.',
  ),
  News(
    title: 'Jujutsu Kaisen Streaming Update',
    summary: 'Latest on Jujutsu Kaisen streaming availability in the US.',
    imageUrl: 'assets/jjk2.webp',
    detail: 'Jujutsu Kaisen season 3 was announced after the culmination of Jujutsu Kaisen season 2, AKA the Shibuya Incident arc – which aired from July 2023 to December 2023. The first teaser appears to be early sketch work and a release window hasn’t been announced, which usually doesn’t bode well for any hopes of it releasing in 2024. Expect 2025 to be the earliest release window for Jujutsu Kaisen season 3. Given that MAPPA is currently working on the Chainsaw Man movie, 2026 may even be more realistic',
  ),
  News(
    title: 'Jujutsu Kaisen Streaming Update',
    summary: 'Latest on Jujutsu Kaisen streaming availability in the US.',
    imageUrl: 'assets/jjk3.jpeg',
    detail: "Fans of Jujutsu Kaisen have been eagerly waiting to see if and when the protagonist Yuji Itadori will unleash Domain Expansion, one of the most formidable abilities within the arsenal of sorcerers and cursed spirits alike. It is very rare among sorcerers to achieve this state as it requires mastery over many aspects of Jujutsu and cursed techniques. Hence, it's unsurprising that the protagonist, Itadori Yuji, hasn't mastered it, as cursed techniques aren't his strong suit. However, the recently released chapters #257 and #258 of Jujutsu Kaisen have shed some new light on how Yuji can take a shortcut and achieve this ability.",
  ),
  News(
    title: 'Jujutsu Kaisen Streaming Update',
    summary: 'Latest on Jujutsu Kaisen streaming availability in the US.',
    imageUrl: 'assets/Mei-Mei-1.webp',
    detail: 'ujutsu Kaisen might seem like it was turning things around for Yuji Itadori, but the newest chapter of the series is kicking things up another notch as Sukuna has started tapping into his divine power! Jujutsu Kaisen has been working its way through the Shinjuku Showdown arc with the latest chapters of the series as Yuji and the surviving Jujutsu Sorcerers have been trying everything they can in order to deal any kind of damage. But Sukuna has not only countered each of their efforts, but is still seemingly getting stronger as the fight continues and presumably even holding back some power.',
  ),
];

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List of News',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'JJK',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 193, 18, 31),
      ),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          final news = newsList[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetailPage(news: news),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(news.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            news.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'JJK',
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            news.summary,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontFamily: 'JJK',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      backgroundColor: Color.fromARGB(255, 0, 48, 73),
    );
  }
}

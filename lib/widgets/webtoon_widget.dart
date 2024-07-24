import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_webtoon/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String id, title, thumb;

  const Webtoon({
    super.key,
    required this.id,
    required this.title,
    required this.thumb,
  });

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => DetailScreen(
        id: id,
        title: title,
        thumb: thumb,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // 애니메이션을 위한 시작과 끝
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        // 여러 트윈을 연결
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      fullscreenDialog: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          _createRoute(),
        );
      },
      child: Column(
        children: [
          Container(
            width: 250,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.5),
                  )
                ]),
            child: Image.network(
              thumb,
              headers: const {"Referer": "https://comic.naver.com"},
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

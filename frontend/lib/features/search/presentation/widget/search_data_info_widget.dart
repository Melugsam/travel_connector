import 'package:flutter/material.dart';

class SearchDataInfoWidget extends StatelessWidget {
  final bool hadSent;

  const SearchDataInfoWidget({super.key, required this.hadSent});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.red[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.sentiment_neutral,
              size: 40,
            ),
            const SizedBox(height: 8),
            Text(
              hadSent
                  ? "Нет данных в выбранной области"
                  : "Вы не выбрали точку на карте",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

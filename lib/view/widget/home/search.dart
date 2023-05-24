import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Row(
          children: const [
            Icon(
              Icons.search,
              size: 20,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text('Search'),
          ],
        ),
      ),
    );
  }
}

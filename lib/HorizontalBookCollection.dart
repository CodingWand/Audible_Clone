import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalBookCollection extends StatefulWidget {
  final String collectionName;
  final int books;

  const HorizontalBookCollection(
      {Key? key, required this.collectionName, required this.books})
      : super(key: key);

  @override
  State<HorizontalBookCollection> createState() => _HorizontalBookCollectionState();
}

class _HorizontalBookCollectionState extends State<HorizontalBookCollection> {
  final ScrollController _myScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.collectionName,
          style: Theme.of(context).textTheme.headline2,
        ),
        Container(
          height: 250,
          padding: EdgeInsets.only(top: 10),
          child: Scrollbar(
            controller: _myScrollController,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              controller: _myScrollController,
              itemCount: widget.books,
              itemBuilder: (_, index) {
                return ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 150,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://m.media-amazon.com/images/I/61y9Jijcz9L._SL500_.jpg",
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        "Harry Potter à l'école des sorciers",
                        softWrap: true,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Par J.K. Rowling",
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

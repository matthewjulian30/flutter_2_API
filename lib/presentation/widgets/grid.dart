import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:uts_2072001/data/list_movie.dart';

import '../pages/detailpage.dart';

class Grid extends StatelessWidget {
  final List<String> titles;
  final List<String> ids;
  final List<String> posters;

  const Grid(
      {Key? key,
      required this.titles,
      required this.ids,
      required this.posters}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 5,
                childAspectRatio: 1 / 1.5),
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailPage(
                      id: ids[index],
                    );
                  }));
                },
                child: Column(
                  children: [
                    Container(
                      height: 260,
                      // child: posters[index] == ''
                      child: (posters.isNotEmpty && posters.length > index && posters[index] != '')
                          ? Image.network(
                              posters[index],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.error,
                                  color: Colors.white,
                                  size: 70,
                                ),
                                Text(
                                  'no image',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      titles.isNotEmpty && titles.length > index && titles[index] != ''
                      ? titles[index]
                      : 'no data',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    )
                  ],
                ),
              );
            }));
  }
}

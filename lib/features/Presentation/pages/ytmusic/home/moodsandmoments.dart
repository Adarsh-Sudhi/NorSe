// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Presentation/pages/saavn/HomePage.dart';
import 'package:norse/features/Presentation/pages/ytmusic/home/moodsplaylist.dart';

class MoodsAndMoments extends StatelessWidget {
  final List moods;
  final String title;
  const MoodsAndMoments({Key? key, required this.moods, required this.title})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        redTitleWidget(one: title, two: ""),
        Spaces.kheigth5,
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
            height: size.height / 4,
            width: size.width,
            child: SizedBox(
              height:
                  moods.length == 3
                      ? 260
                      : moods.length == 2
                      ? 190
                      : moods.length == 1
                      ? 115
                      : moods.isEmpty
                      ? 0
                      : 330,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child:
                        moods.isNotEmpty
                            ? PageView.builder(
                              padEnds: false,
                              controller: PageController(
                                viewportFraction: 0.48,
                                initialPage: 0,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: (moods.length / 3).ceil(),
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  width: size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: List.generate(3, (innerIndex) {
                                      final itemIndex = index * 3 + innerIndex;
                                      if (itemIndex < moods.length) {
                                        return Center(
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (_) => Moodsplaylist(
                                                        title: moods[itemIndex]['title'],
                                                        param:
                                                            moods[itemIndex]['params'],
                                                      ),
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.grey.withValues(
                                                    alpha: 0.2,
                                                  ),
                                                ),

                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 5,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors
                                                                .accents[Random()
                                                                .nextInt(
                                                                  Colors
                                                                      .accents
                                                                      .length,
                                                                )],
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10,
                                                            ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Center(
                                                        child: Textutil(
                                                          text:
                                                              moods[itemIndex]['title'],
                                                          fontsize: 15,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    }),
                                  ),
                                );
                              },
                            )
                            : const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

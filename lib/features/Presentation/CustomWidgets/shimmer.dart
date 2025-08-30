// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../configs/constants/Spaces.dart';

class Songloadingwidget extends StatelessWidget {
  final Size size;
  const Songloadingwidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 4,
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                Spaces.kheight20,
                SizedBox(
                  width: size.width / 2.5,
                  height: size.height / 5.7,
                  child: Shimmer.fromColors(
                    period: const Duration(seconds: 2),
                    baseColor: Color(0xFFB0BEC5), // blue gray
                    highlightColor: Color(0xFFCFD8DC),

                    //  baseColor: Colors.grey,// const Color.fromARGB(255, 18, 41, 61),
                    //  highlightColor: Spaces.baseColor,
                    //  const Color.fromARGB(255, 2, 38, 68).withOpacity(0.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 33, 57),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                Spaces.kheight20,
                SizedBox(
                  height: 6,
                  width: size.width / 3.4,
                  child: Shimmer.fromColors(
                    period: const Duration(seconds: 2),
                    baseColor: Color(0xFFB0BEC5), // blue gray
                    highlightColor: Color(0xFFCFD8DC),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 33, 57),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class LoadingText extends StatelessWidget {
  final Size size;
  final double width;
  const LoadingText({super.key, required this.size, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: width,
      child: Shimmer.fromColors(
        period: const Duration(seconds: 2),
        baseColor: const Color.fromARGB(255, 18, 41, 61),
        highlightColor: const Color.fromARGB(255, 2, 38, 68).withOpacity(0.5),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 3, 33, 57),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

class Searchsongloading extends StatelessWidget {
  const Searchsongloading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: SizedBox(
          height: 50,
          width: 50,
          child: Shimmer.fromColors(
            period: const Duration(seconds: 2),
            baseColor: Color(0xFFB0BEC5), // blue gray
            highlightColor: Color(0xFFCFD8DC),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 3, 33, 57),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ),
        subtitle: SizedBox(
          width: 200,
          height: 7,
          child: Shimmer.fromColors(
            period: const Duration(seconds: 2),
            baseColor: Color(0xFFB0BEC5), // blue gray
            highlightColor: Color(0xFFCFD8DC),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 3, 33, 57),
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
        ),
        title: SizedBox(
          width: MediaQuery.sizeOf(context).width / 1.5,
          height: 10,
          child: Shimmer.fromColors(
            period: const Duration(seconds: 2),
            baseColor: Color(0xFFB0BEC5), // blue gray
            highlightColor: Color(0xFFCFD8DC),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 3, 33, 57),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Onlinesongslistshimmer extends StatelessWidget {
  const Onlinesongslistshimmer({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 50,
        width: 50,
        child: Shimmer.fromColors(
          period: const Duration(seconds: 1),
          baseColor: const Color.fromARGB(255, 18, 41, 61),
          highlightColor: const Color.fromARGB(255, 2, 38, 68).withOpacity(0.5),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 3, 33, 57),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      title: SizedBox(
        height: 10,
        width: size.width / 3.4,
        child: Shimmer.fromColors(
          period: const Duration(seconds: 1),
          baseColor: const Color.fromARGB(255, 18, 41, 61),
          highlightColor: const Color.fromARGB(255, 2, 38, 68).withOpacity(0.5),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 3, 33, 57),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      subtitle: SizedBox(
        height: 8,
        width: size.width / 3.4,
        child: Shimmer.fromColors(
          period: const Duration(seconds: 1),
          baseColor: const Color.fromARGB(255, 18, 41, 61),
          highlightColor: const Color.fromARGB(255, 2, 38, 68).withOpacity(0.5),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 3, 33, 57),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

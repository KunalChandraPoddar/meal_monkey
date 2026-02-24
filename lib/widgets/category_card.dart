  import 'package:flutter/material.dart';

  class CategoryCard extends StatelessWidget {
    final String image;
    final String items;
    final String title;
    final VoidCallback? onTap; 

    const CategoryCard({
      super.key,
      required this.image,
      required this.items,
      required this.title,
      required this.onTap,
    });

    @override
    Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(bottom: 25),
        height: 70,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
              left: 40,
              right: 0,
              child: Container(
                height: 70,
                padding: const EdgeInsets.only(left: 55, right: 50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 18,
                      color: Colors.black12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(items, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 0,
              child: Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(child: Image.asset(image, fit: BoxFit.cover)),
              ),
            ),

            Positioned(
              right: -8,
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 12,
                      color: Colors.black12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset("lib/assets/png/arrow.png", height: 14),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

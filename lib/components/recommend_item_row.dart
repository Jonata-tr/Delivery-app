import 'package:delivery_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class RecommendItemRow extends StatelessWidget {
  final Map rObj;
  final GestureTapCallback onTap;

  const RecommendItemRow({super.key, required this.rObj, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  rObj["image"].toString(),
                  width: media.width * 0.25,
                  height: media.width * 0.25,
                  fit: BoxFit.cover,
                )),
            const SizedBox(width: 16),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rObj["name"],
                  style: TextStyle(
                    fontFamily: 'BentoSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Tcolor.buttonText,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  rObj["type"],
                  style: TextStyle(
                    fontFamily: 'BentoSans',
                    fontSize: 14,
                    color: Tcolor.buttonText,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_outlined,
                      color: Tcolor.primaryColor,
                      size: 20,
                    ),
                    Text(
                      rObj["rate"],
                      style: TextStyle(
                        fontFamily: 'BentoSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Tcolor.buttonText,
                      ),
                    ),
                    Text(
                      '    (${rObj["rating"]})',
                      style: TextStyle(
                        fontFamily: 'BentoSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Tcolor.placeHolder,
                      ),
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

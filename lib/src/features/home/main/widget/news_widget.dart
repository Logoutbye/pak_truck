import 'package:flutter/material.dart';

import 'package:testt/src/configs/extensions.dart';

Widget buildNewsWidget(BuildContext context, List<Map<String, String>> items) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Wrap(
      spacing: 8.0, // Horizontal spacing
      runSpacing: 8.0, // Vertical spacing
      children: items.map((item) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: context.mediaQueryWidth / 3,
                  margin: const EdgeInsets.all(2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      item['image']!,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Text Content
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item['title']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['description']!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    ),
  );
}

import 'package:flutter/material.dart';

class SpecialistCategorySection extends StatelessWidget {
  const SpecialistCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/heart.png", "title": "Cardiology"},
      {"icon": "assets/icons/tooth.png", "title": "Dentist"},
      {"icon": "assets/icons/bone.png", "title": "Orthopedic"},
      {"icon": "assets/icons/brain.png", "title": "Neurology"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Appointment with a specialist",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("See All", style: TextStyle(color: Colors.blueAccent)),
          ],
        ),
        const SizedBox(height: 4),
        const Text("Choose category", style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 12),

        // 🔹 Horizontal Category Cards
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Container(
                width: 110,
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        category["icon"],
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category["title"],
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

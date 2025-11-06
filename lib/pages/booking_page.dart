import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int selectedDay = 3;
  int selectedHour = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Schedule'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 👩‍⚕️ Doctor Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('lib/assets/images/doctor.png'),
                  ),
                  const SizedBox(width: 30, height: 100),
                  Expanded(
                    child: Text(
                      'Dr. Yesica\nCardiology Specialist\n5 Years Experience',
                      style: GoogleFonts.poppins(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),

            // 🩺 Doctor Details
            const SizedBox(height: 24),
            Text(
              "Dr. Yesica is an experienced cardiology specialist with over 5 years of expertise in diagnosing and treating heart-related conditions. She is dedicated to providing compassionate, personalized care and has earned a 5.0-star rating for her professionalism and patient satisfaction.",
              style: GoogleFonts.poppins(color: Colors.grey),
            ),

            const SizedBox(height: 24),

            const Text(
              "Choose your slot",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                int day = index + 2;
                List<String> dayName = ["Mon", "Tue", "Wed", "Thu", "Fri"];
                return ChoiceChip(
                  label: Text("${dayName[index]} $day"),
                  selected: selectedDay == day,
                  onSelected: (_) => setState(() => selectedDay = day),
                );
              }),
            ),

            const SizedBox(height: 20),

            const Text(
              "Available Hour",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),

            Wrap(
              spacing: 12,
              children: [10, 11, 13, 14].map((hour) {
                return ChoiceChip(
                  label: Text("$hour.00"),
                  selected: selectedHour == hour,
                  onSelected: (_) => setState(() => selectedHour = hour),
                );
              }).toList(),
            ),

            const SizedBox(height: 40),

            // 🔵 Make Appointment Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'lib/assets/images/success.png', // ganti sesuai path gambar kamu
                              height: 120,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Your Appointment\nSuccess!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 25),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                    (Route<dynamic> route) => false,
                                  );
                                },
                                child: const Text(
                                  'Back to Homepage',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  "Make an Appointment",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

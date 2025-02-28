import 'package:flutter/material.dart';
import 'home.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Welcome to the',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Anoopam Centre of Excellence - AI',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Counselling System',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                    // decoration: TextDecoration.underline,
                    decorationThickness: 1, // Adjust underline thickness here
                  ),
                textAlign: TextAlign.center
                ),
                const SizedBox(height: 40),
                Image.asset(
                  'assets/logo/mission.png',
                  height: 200, width: 200,
                  fit: BoxFit.contain,
                ),                
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(100), // Use withAlpha (255 * 0.7 ≈ 178.5, so 180 is a close approximation)
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address: Anoopam Mission, Brahmajyoti, Yogiji Marg, Near V.V. Nagar, Mogri, Anand, Gujarat',
                        style: TextStyle(fontSize: 16, color: Colors.black,
                        shadows: [
                      Shadow(
                        color: Colors.white,
                        offset: Offset(2, 2),
                        blurRadius: 5,
                      ),
                    ],),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Website: www.itcentre.org',
                        style: TextStyle(fontSize: 16, color: Colors.black,
                        shadows: [
                      Shadow(
                        color: Colors.white,
                        offset: Offset(2, 2),
                        blurRadius: 5,
                      ),
                    ],),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Email: eitcmogri@gmail.com',
                        style: TextStyle(fontSize: 16, color: Colors.black,
                        shadows: [
                      Shadow(
                        color: Colors.white,
                        offset: Offset(2, 2),
                        blurRadius: 5,
                      ),
                    ],),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    textStyle: const TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text('TAP TO BEGIN'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

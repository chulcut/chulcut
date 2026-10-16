import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const ChulCutApp());
}

class ChulCutApp extends StatelessWidget {
  const ChulCutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChulCut',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE91E63),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF8FB),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: false,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE91E63),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFF3B6CE)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFF3B6CE)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFE91E63), width: 2),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(28),
              ),
              child: const Icon(
                Icons.content_cut,
                color: Colors.white,
                size: 58,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'ChulCut',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your Salon, Your Style',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            const SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/chulcut_welcome.png',
              fit: BoxFit.cover,
            ),
          ),

          // Pink gradient
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x22FFB6D5),
                    Color(0x00FFB6D5),
                    Color(0xC9002B45),
                    Color(0xFFF00068),
                  ],
                  stops: [0.0, 0.35, 0.72, 1.0],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // TOP BRAND
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE91E63),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.content_cut_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 8),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -1.5,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Chul',
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'Cut',
                                  style: TextStyle(color: Color(0xFFE91E63)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 3),

                      const Text(
                        'Book Your Slot • Save Your Time',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // MAIN MESSAGE
                const Text(
                  'Your Beauty\nOur Priority',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 31,
                    height: 1.12,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Book • Relax • Repeat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 18),

                // DOTS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [_dot(true), _dot(false), _dot(false)],
                ),

                const SizedBox(height: 22),

                // GET STARTED
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MobileLoginScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF1976),
                        foregroundColor: Colors.white,
                        elevation: 8,
                        shadowColor: const Color(0xAA8E0038),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 12),
                          Icon(Icons.arrow_forward_rounded, size: 26),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _dot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: active ? 24 : 9,
      height: 9,
      decoration: BoxDecoration(
        color: active
            ? const Color(0xFFFF1976)
            : Colors.white.withValues(alpha: 0.65),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  final TextEditingController mobileController = TextEditingController();

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  void continueToOTP() {
    if (mobileController.text.length == 10) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              OTPVerificationScreen(mobileNumber: mobileController.text),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid 10 digit mobile number.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Login')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            const Text(
              'Enter your mobile number',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            const Text(
              'We will send you an OTP to verify your number.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 35),

            const Text(
              'Mobile Number',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: mobileController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                prefixText: '+91 ',
                hintText: 'Enter mobile number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: continueToOTP,
                child: const Text('Continue', style: TextStyle(fontSize: 17)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OTPVerificationScreen extends StatefulWidget {
  final String mobileNumber;

  const OTPVerificationScreen({super.key, required this.mobileNumber});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void verifyOTP() {
    if (otpController.text.length == 6) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a 6 digit OTP.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify OTP')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            const Text(
              'Enter OTP',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Text(
              'Enter the 6 digit OTP sent to +91 ${widget.mobileNumber}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 35),

            const Text(
              'OTP',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: const InputDecoration(
                hintText: 'Enter 6 digit OTP',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: verifyOTP,
                child: const Text('Verify OTP', style: TextStyle(fontSize: 17)),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text('Resend OTP'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FA),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TOP HEADER
                    Row(
                      children: [
                        // ChulCut Logo
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE1EE),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(
                            Icons.content_cut,
                            color: Color(0xFFE91E63),
                            size: 25,
                          ),
                        ),

                        const SizedBox(width: 10),

                        // ChulCut + Location
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ChulCut',
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 14,
                                    color: Color(0xFFE91E63),
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    'Garhwa, Jharkhand',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Profile
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: Color(0xFFFFE1EE),
                                child: Icon(
                                  Icons.person_rounded,
                                  color: Color(0xFFE91E63),
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 6),
                              Text(
                                'Vikas',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 8),

                        // Notification
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(
                            Icons.notifications_none_rounded,
                            size: 24,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // GREETING
                    const Text(
                      'Find your perfect salon',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'Book your slot and save your time.',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),

                    const SizedBox(height: 18),

                    // SEARCH BAR
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 14,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),

                          const Icon(
                            Icons.search_rounded,
                            color: Color(0xFFE91E63),
                            size: 25,
                          ),

                          const SizedBox(width: 12),

                          const Expanded(
                            child: Text(
                              'Search salons, services or location...',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ),

                          Container(
                            width: 42,
                            height: 42,
                            margin: const EdgeInsets.only(right: 7),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE1EE),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(
                              Icons.tune_rounded,
                              color: Color(0xFFE91E63),
                              size: 21,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // CATEGORY TITLE
                    const Text(
                      'What are you looking for?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // CATEGORIES
                    Row(
                      children: [
                        _category(Icons.content_cut, "Men's Salon"),
                        const SizedBox(width: 10),
                        _category(Icons.face_retouching_natural, "Unisex"),
                        const SizedBox(width: 10),
                        _category(Icons.face_3, "Beauty\nParlour"),
                        const SizedBox(width: 10),
                        _category(Icons.spa_rounded, "Spa"),
                      ],
                    ),

                    const SizedBox(height: 30),
                    // SPECIAL OFFER
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFFE0EC), Color(0xFFFFB6D2)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE91E63),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    'SPECIAL OFFER',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 10),

                                const Text(
                                  'Flat 20% OFF',
                                  style: TextStyle(
                                    color: Color(0xFFE91E63),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 2),

                                const Text(
                                  'on First Booking',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                const Text(
                                  'Use Code: CHULCUT20',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 11,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE91E63),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Text(
                                    'Book Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 10),

                          Container(
                            width: 90,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.45),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Icon(
                              Icons.card_giftcard_rounded,
                              color: Color(0xFFE91E63),
                              size: 55,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // NEARBY SALONS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nearby Salons',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                            color: const Color(0xFFE91E63),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    // SALON CARD 1
                    _salonCard(
                      context,
                      'Premium Style Salon',
                      'Garhwa Main Road',
                      '4.8',
                      '1.2 km',
                      'Available Now',
                      'Low Traffic • 5–10 min wait',
                      '11:30 AM',
                    ),

                    const SizedBox(height: 14),

                    // SALON CARD 2
                    _salonCard(
                      context,
                      'Royal Look Unisex Salon',
                      'Ranka Road, Garhwa',
                      '4.6',
                      '2.1 km',
                      'High Traffic',
                      '45–60 min wait',
                      '2:30 PM',
                    ),

                    const SizedBox(height: 14),

                    // POPULAR SERVICES
                    const Text(
                      'Popular Services',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _serviceCard(Icons.content_cut_rounded, 'Haircut'),
                          _serviceCard(Icons.face_retouching_natural, 'Beard'),
                          _serviceCard(Icons.spa_rounded, 'Hair Spa'),
                          _serviceCard(Icons.face_3_rounded, 'Facial'),
                          _serviceCard(
                            Icons.cleaning_services_rounded,
                            'Shaving',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // HOME SERVICE
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF3D82), Color(0xFFE91E63)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 58,
                            height: 58,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.20),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Icon(
                              Icons.home_outlined,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Salon at Your Home',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                const Text(
                                  'Professional salon service at your doorstep',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 13,
                                    vertical: 7,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    'Choose Service →',
                                    style: TextStyle(
                                      color: Color(0xFFE91E63),
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // BOTTOM NAVIGATION
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _BottomNavItem(Icons.home_rounded, 'Home', true),
                  _BottomNavItem(Icons.search_rounded, 'Search', false),
                  _BottomNavItem(
                    Icons.calendar_month_rounded,
                    'Bookings',
                    false,
                  ),
                  _BottomNavItem(
                    Icons.card_giftcard_rounded,
                    'Referral',
                    false,
                  ),
                  _BottomNavItem(
                    Icons.person_outline_rounded,
                    'Profile',
                    false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _serviceCard(IconData icon, String title) {
    return Container(
      width: 105,
      height: 120,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE1EE),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: const Color(0xFFE91E63), size: 25),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _category(IconData icon, String title) {
    return Expanded(
      child: Container(
        height: 104,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFFFE1EE),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, color: const Color(0xFFE91E63), size: 25),
            ),

            const SizedBox(height: 8),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _salonCard(
    BuildContext context,
    String name,
    String location,
    String rating,
    String distance,
    String availability,
    String trafficInfo,
    String nextAvailableTime,
  ) {
    final bool isAvailable = availability == 'Available Now';
    final bool isModerate = availability == 'Moderate Traffic';

    final Color statusColor = isAvailable
        ? Colors.green
        : isModerate
        ? Colors.orange
        : Colors.red;

    final Color statusBackground = isAvailable
        ? const Color(0xFFE8F8EE)
        : isModerate
        ? const Color(0xFFFFF4E5)
        : const Color(0xFFFFEBEE);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // SALON IMAGE / PLACEHOLDER
          Container(
            width: 82,
            height: 82,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE1EE),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.storefront_rounded,
              color: Color(0xFFE91E63),
              size: 38,
            ),
          ),

          const SizedBox(width: 12),

          // SALON DETAILS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const Icon(
                      Icons.favorite_border_rounded,
                      color: Color(0xFFE91E63),
                      size: 21,
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Color(0xFFE91E63),
                      size: 14,
                    ),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 7),

                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: 17,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Icon(
                      Icons.near_me_outlined,
                      color: Colors.grey,
                      size: 15,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      distance,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusBackground,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),

                      const SizedBox(width: 5),

                      Text(
                        availability,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 7),

                      Flexible(
                        child: Text(
                          trafficInfo,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                // BOOK NOW
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SalonDetailsScreen(
                            salonName: name,
                            location: location,
                            rating: rating,
                            distance: distance,
                            availability: availability,
                            trafficInfo: trafficInfo,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE91E63),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool active;

  const _BottomNavItem(this.icon, this.title, this.active);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: active ? const Color(0xFFE91E63) : Colors.grey,
          size: 25,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 11,
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
            color: active ? const Color(0xFFE91E63) : Colors.grey,
          ),
        ),
      ],
    );
  }
}

class SalonDetailsScreen extends StatelessWidget {
  final String salonName;
  final String location;
  final String rating;
  final String distance;
  final String availability;
  final String trafficInfo;
  final String nextAvailableTime;

  const SalonDetailsScreen({
    super.key,
    required this.salonName,
    required this.location,
    required this.rating,
    required this.distance,
    this.availability = 'Available Now',
    this.trafficInfo = 'Low Traffic • 5–10 min wait',
    this.nextAvailableTime = '11:30 AM',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FA),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Salon Details',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_rounded,
              color: Color(0xFFE91E63),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SALON COVER
            Container(
              width: double.infinity,
              height: 190,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFE1EE), Color(0xFFFFB6D2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.storefront_rounded,
                color: Color(0xFFE91E63),
                size: 70,
              ),
            ),

            const SizedBox(height: 18),

            // SALON NAME
            Text(
              salonName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // LOCATION
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Color(0xFFE91E63),
                  size: 18,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    location,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // RATING + DISTANCE
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE1EE),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                Row(
                  children: [
                    const Icon(
                      Icons.near_me_outlined,
                      color: Colors.grey,
                      size: 17,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      distance,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 25),

            // LIVE SALON AVAILABILITY
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: availability == 'Available Now'
                    ? const Color(0xFFE8F8EE)
                    : availability == 'Moderate Traffic'
                    ? const Color(0xFFFFF4E5)
                    : const Color(0xFFFFEBEE),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFB7E4C7)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: availability == 'Available Now'
                            ? Colors.green
                            : availability == 'Moderate Traffic'
                            ? Colors.orange
                            : Colors.red,
                        size: 11,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          availability,
                          style: TextStyle(
                            color: availability == 'Available Now'
                                ? Colors.green
                                : availability == 'Moderate Traffic'
                                ? Colors.orange
                                : Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.wifi_tethering_rounded,
                        color: availability == 'Available Now'
                            ? Colors.green
                            : availability == 'Moderate Traffic'
                            ? Colors.orange
                            : Colors.red,
                        size: 22,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    trafficInfo,
                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Next available appointment: $nextAvailableTime',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ABOUT
            const Text(
              'About Salon',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              'Experience professional salon services with trained professionals, '
              'quality products and a comfortable environment.',
              style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.5),
            ),

            const SizedBox(height: 25),

            // SERVICES
            const Text(
              'Popular Services',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _detailServiceCard(
                    Icons.content_cut_rounded,
                    'Haircut',
                    '₹150',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _detailServiceCard(
                    Icons.face_retouching_natural,
                    'Beard',
                    '₹100',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: _detailServiceCard(
                    Icons.spa_rounded,
                    'Hair Spa',
                    '₹400',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _detailServiceCard(
                    Icons.face_3_rounded,
                    'Facial',
                    '₹500',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // BOOK APPOINTMENT
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChooseServicesScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Book Appointment',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _detailServiceCard(IconData icon, String title, String price) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE1EE),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: const Color(0xFFE91E63), size: 22),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFFE91E63),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChooseServicesScreen extends StatefulWidget {
  const ChooseServicesScreen({super.key});

  @override
  State<ChooseServicesScreen> createState() => _ChooseServicesScreenState();
}

class _ChooseServicesScreenState extends State<ChooseServicesScreen> {
  final Set<String> selectedServices = {};

  String selectedCategory = 'Hair';

  final List<Map<String, dynamic>> categories = [
    {'name': 'Hair', 'icon': Icons.content_cut_rounded},
    {'name': 'Beard & Shaving', 'icon': Icons.face_retouching_natural},
    {'name': 'Face & Skin', 'icon': Icons.face_3_rounded},
    {'name': 'Beauty', 'icon': Icons.brush_rounded},
    {'name': 'Spa', 'icon': Icons.spa_rounded},
  ];

  final List<Map<String, dynamic>> services = [
    // Hair
    {
      'name': 'Haircut',
      'category': 'Hair',
      'price': 150,
      'duration': '30 min',
      'homeService': true,
      'icon': Icons.content_cut_rounded,
    },
    {
      'name': 'Hair Styling',
      'category': 'Hair',
      'price': 200,
      'duration': '30 min',
      'homeService': true,
      'icon': Icons.content_cut_rounded,
    },
    {
      'name': 'Hair Wash',
      'category': 'Hair',
      'price': 100,
      'duration': '15 min',
      'homeService': true,
      'icon': Icons.water_drop_rounded,
    },
    {
      'name': 'Hair Spa',
      'category': 'Hair',
      'price': 400,
      'duration': '45 min',
      'homeService': true,
      'icon': Icons.spa_rounded,
    },
    {
      'name': 'Hair Colour',
      'category': 'Hair',
      'price': 500,
      'duration': '60 min',
      'homeService': false,
      'icon': Icons.brush_rounded,
    },
    {
      'name': 'Hair Treatment',
      'category': 'Hair',
      'price': 600,
      'duration': '60 min',
      'homeService': false,
      'icon': Icons.spa_rounded,
    },

    // Beard & Shaving
    {
      'name': 'Beard Trim',
      'category': 'Beard & Shaving',
      'price': 100,
      'duration': '15 min',
      'homeService': true,
      'icon': Icons.face_retouching_natural,
    },
    {
      'name': 'Beard Setting',
      'category': 'Beard & Shaving',
      'price': 150,
      'duration': '20 min',
      'homeService': true,
      'icon': Icons.face_retouching_natural,
    },
    {
      'name': 'Clean Shave',
      'category': 'Beard & Shaving',
      'price': 100,
      'duration': '15 min',
      'homeService': true,
      'icon': Icons.face_retouching_natural,
    },
    {
      'name': 'Beard Colour',
      'category': 'Beard & Shaving',
      'price': 250,
      'duration': '30 min',
      'homeService': false,
      'icon': Icons.brush_rounded,
    },

    // Face & Skin
    {
      'name': 'Facial',
      'category': 'Face & Skin',
      'price': 500,
      'duration': '45 min',
      'homeService': true,
      'icon': Icons.face_3_rounded,
    },
    {
      'name': 'Cleanup',
      'category': 'Face & Skin',
      'price': 300,
      'duration': '30 min',
      'homeService': true,
      'icon': Icons.face_3_rounded,
    },
    {
      'name': 'Scrub',
      'category': 'Face & Skin',
      'price': 250,
      'duration': '20 min',
      'homeService': true,
      'icon': Icons.face_3_rounded,
    },
    {
      'name': 'Detan',
      'category': 'Face & Skin',
      'price': 350,
      'duration': '30 min',
      'homeService': true,
      'icon': Icons.face_3_rounded,
    },
    {
      'name': 'Face Massage',
      'category': 'Face & Skin',
      'price': 250,
      'duration': '20 min',
      'homeService': true,
      'icon': Icons.spa_rounded,
    },

    // Beauty
    {
      'name': 'Eyebrow',
      'category': 'Beauty',
      'price': 50,
      'duration': '10 min',
      'homeService': true,
      'icon': Icons.face_3_rounded,
    },
    {
      'name': 'Upper Lip',
      'category': 'Beauty',
      'price': 50,
      'duration': '10 min',
      'homeService': true,
      'icon': Icons.face_3_rounded,
    },
    {
      'name': 'Threading',
      'category': 'Beauty',
      'price': 100,
      'duration': '15 min',
      'homeService': true,
      'icon': Icons.face_3_rounded,
    },
    {
      'name': 'Manicure',
      'category': 'Beauty',
      'price': 250,
      'duration': '30 min',
      'homeService': true,
      'icon': Icons.brush_rounded,
    },
    {
      'name': 'Pedicure',
      'category': 'Beauty',
      'price': 300,
      'duration': '40 min',
      'homeService': true,
      'icon': Icons.brush_rounded,
    },

    // Spa
    {
      'name': 'Head Massage',
      'category': 'Spa',
      'price': 200,
      'duration': '20 min',
      'homeService': true,
      'icon': Icons.spa_rounded,
    },
    {
      'name': 'Body Massage',
      'category': 'Spa',
      'price': 800,
      'duration': '60 min',
      'homeService': false,
      'icon': Icons.spa_rounded,
    },
  ];

  List<Map<String, dynamic>> get filteredServices {
    return services
        .where((service) => service['category'] == selectedCategory)
        .toList();
  }

  int get totalAmount {
    int total = 0;

    for (final service in services) {
      if (selectedServices.contains(service['name'])) {
        total += service['price'] as int;
      }
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Choose Services',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select your services',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'Choose one or more services for your appointment.',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),

                  const SizedBox(height: 20),

                  // Categories
                  SizedBox(
                    height: 48,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        final bool isSelected =
                            selectedCategory == category['name'];

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = category['name'];
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFE91E63)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFFE91E63)
                                    : Colors.grey.shade200,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  category['icon'],
                                  size: 18,
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFFE91E63),
                                ),
                                const SizedBox(width: 7),
                                Text(
                                  category['name'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Services
                  ...filteredServices.map((service) {
                    final String name = service['name'];
                    final int price = service['price'];
                    final String duration = service['duration'];
                    final bool homeService = service['homeService'];
                    final IconData icon = service['icon'];

                    final bool isSelected = selectedServices.contains(name);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedServices.remove(name);
                          } else {
                            selectedServices.add(name);
                          }
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFFE91E63)
                                : Colors.transparent,
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE1EE),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Icon(
                                icon,
                                color: const Color(0xFFE91E63),
                                size: 25,
                              ),
                            ),

                            const SizedBox(width: 14),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 5),

                                  Row(
                                    children: [
                                      Text(
                                        '₹$price',
                                        style: const TextStyle(
                                          color: Color(0xFFE91E63),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      const SizedBox(width: 10),

                                      Text(
                                        duration,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),

                                  if (homeService) ...[
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Home Service Available',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),

                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFFE91E63)
                                    : Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFFE91E63)
                                      : Colors.grey.shade300,
                                ),
                              ),
                              child: isSelected
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 18,
                                    )
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),

          // Bottom Summary
          Container(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${selectedServices.length} Service${selectedServices.length == 1 ? '' : 's'} Selected',
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    Text(
                      'Total: ₹$totalAmount',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE91E63),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: selectedServices.isEmpty
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ChooseProfessionalScreen(),
                              ),
                            );
                          },
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChooseProfessionalScreen extends StatefulWidget {
  const ChooseProfessionalScreen({super.key});

  @override
  State<ChooseProfessionalScreen> createState() =>
      _ChooseProfessionalScreenState();
}

class _ChooseProfessionalScreenState extends State<ChooseProfessionalScreen> {
  String selectedProfessional = 'Any Available Professional';

  final List<Map<String, dynamic>> professionals = [
    {
      'name': 'Any Available Professional',
      'role': 'Recommended',
      'rating': '4.9',
      'experience': 'Salon will assign an available professional',
      'icon': Icons.groups_rounded,
    },
    {
      'name': 'Rahul',
      'role': 'Hair Expert',
      'rating': '4.8',
      'experience': '5 years experience',
      'icon': Icons.person_rounded,
    },
    {
      'name': 'Amit',
      'role': 'Beard & Styling Expert',
      'rating': '4.7',
      'experience': '4 years experience',
      'icon': Icons.person_rounded,
    },
    {
      'name': 'Neha',
      'role': 'Beauty Expert',
      'rating': '4.9',
      'experience': '6 years experience',
      'icon': Icons.person_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Choose Professional',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choose your professional',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'You can choose a professional or let the salon assign one.',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),

                  const SizedBox(height: 22),

                  ...professionals.map((professional) {
                    final String name = professional['name'];
                    final String role = professional['role'];
                    final String rating = professional['rating'];
                    final String experience = professional['experience'];
                    final IconData icon = professional['icon'];

                    final bool isSelected = selectedProfessional == name;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedProfessional = name;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFFE91E63)
                                : Colors.transparent,
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE1EE),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                icon,
                                color: const Color(0xFFE91E63),
                                size: 28,
                              ),
                            ),

                            const SizedBox(width: 14),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          name,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                        size: 17,
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        rating,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 4),

                                  Text(
                                    role,
                                    style: const TextStyle(
                                      color: Color(0xFFE91E63),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text(
                                    experience,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 8),

                            Container(
                              width: 27,
                              height: 27,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? const Color(0xFFE91E63)
                                    : Colors.white,
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFFE91E63)
                                      : Colors.grey.shade300,
                                ),
                              ),
                              child: isSelected
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 17,
                                    )
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectDateTimeScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectDateTimeScreen extends StatefulWidget {
  const SelectDateTimeScreen({super.key});

  @override
  State<SelectDateTimeScreen> createState() => _SelectDateTimeScreenState();
}

class _SelectDateTimeScreenState extends State<SelectDateTimeScreen> {
  int selectedDateIndex = 0;
  String selectedTime = '';

  final List<Map<String, String>> dates = [
    {'day': 'Today', 'date': '7', 'month': 'Oct'},
    {'day': 'Tomorrow', 'date': '8', 'month': 'Oct'},
    {'day': 'Friday', 'date': '9', 'month': 'Oct'},
    {'day': 'Saturday', 'date': '10', 'month': 'Oct'},
    {'day': 'Sunday', 'date': '11', 'month': 'Oct'},
  ];

  final List<String> timeSlots = [
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '01:00 PM',
    '02:00 PM',
    '02:30 PM',
    '03:00 PM',
    '03:30 PM',
    '04:00 PM',
    '04:30 PM',
    '05:00 PM',
    '05:30 PM',
    '06:00 PM',
    '06:30 PM',
    '07:00 PM',
    '07:30 PM',
    '08:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Select Date & Time',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choose date',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'Select a convenient date for your appointment.',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),

                  const SizedBox(height: 18),

                  SizedBox(
                    height: 92,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: dates.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final date = dates[index];
                        final bool isSelected = selectedDateIndex == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDateIndex = index;
                              selectedTime = '';
                            });
                          },
                          child: Container(
                            width: 75,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFE91E63)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFFE91E63)
                                    : Colors.grey.shade200,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  date['day']!,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  date['date']!,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                                Text(
                                  date['month']!,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    'Available time slots',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'Choose a time that works best for you.',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),

                  const SizedBox(height: 18),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: timeSlots.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2.4,
                        ),
                    itemBuilder: (context, index) {
                      final String time = timeSlots[index];
                      final bool isSelected = selectedTime == time;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTime = time;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFE91E63)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFFE91E63)
                                  : Colors.grey.shade200,
                            ),
                          ),
                          child: Text(
                            time,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: isSelected ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: selectedTime.isEmpty ? null : () {},
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

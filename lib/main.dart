import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leez/frontend/models/property_provider.dart';
import 'package:leez/frontend/screens/common/auth/signup.dart';
import 'package:leez/frontend/screens/common/splash.dart';
import 'package:leez/frontend/screens/retailer/home/rent_navbar.dart';
import 'package:leez/frontend/screens/user/home/homescreen.dart';
import 'package:leez/frontend/screens/user/home/navbar.dart';
import 'package:leez/frontend/screens/user/profile/profile.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:device_preview/device_preview.dart';

// Create AuthProvider to manage authentication state
class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  AuthProvider() {
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  User? get user => _user;

  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}





// In your main.dart file

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Add AuthProvider
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        // Property provider
        ChangeNotifierProvider(
          create: (_) => PropertyProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leez A Rental Platform',
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}





// void main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp(
//   //   options: DefaultFirebaseOptions.currentPlatform,
//   // );
  
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode, // Enable DevicePreview in debug mode
//       builder: (context) => MultiProvider(
//         providers: [
//           // Add AuthProvider
//           ChangeNotifierProvider(
//             create: (_) => AuthProvider(),
//           ),
//           // Property provider
//           ChangeNotifierProvider(
//             create: (_) => PropertyProvider(),
//           ),
//         ],
//         child: const MyApp(),
//       ),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       useInheritedMediaQuery: true,
//       locale: DevicePreview.locale(context), // For DevicePreview
//       builder: DevicePreview.appBuilder, 
//       title: 'Leez A Rental Platform',
//       home: const HomeScreen(),
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//     );
//   }
// }



// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   print('Initializing Firebase...');
  




//   try {
//     await Firebase.initializeApp(
//       options: const FirebaseOptions(
//         apiKey: 'AIzaSyBwFt8SHjYPjvI0o27zAGkwlxbrDsC-gYs',
//         authDomain: 'leez-ptiz14.firebaseapp.com',
//         projectId:'leez-ptiz14',
//         storageBucket:'leez-ptiz14.firebasestorage.app',
//         messagingSenderId: '170736783315',
//         appId:  '1:170736783315:web:7e6a4ebfff89ce08d52926',
//         measurementId: 'G-N3DF3LQHYS'
//       ),
//     );
//     print('Firebase initialized successfully');
//   } catch (e) {
//     print('Error initializing Firebase: $e');
//   }
//   runApp(const MyApp());
// }


// // Rest of your code remains unchanged

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       //       useInheritedMediaQuery: true,
//       // locale: DevicePreview.locale(context), // For DevicePreview
//       // builder: DevicePreview.appBuilder, 

//       debugShowCheckedModeBanner: false,
//       title: 'Event Registration',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const AuthWrapper(),
//     );
//   }
// }

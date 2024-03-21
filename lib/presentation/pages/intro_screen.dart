// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class IntroductionScreen extends ConsumerWidget {
//   const IntroductionScreen({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage(
//                 'https://as1.ftcdn.net/v2/jpg/06/05/37/40/1000_F_605374009_hEUHatmKPzuHTIacg7rLneAgnLHUgegM.jpg'), // Change the image path accordingly
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Center(
//           child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 450,
//                 ),
//                 const Text(
//                   'Discover the World of Music',
//                   style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color:
//                         Colors.black, // Adjust text color for better visibility
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Explore a vast library of songs from various genres,'
//                   'artists, and albums. Enjoy personalized recommendations'
//                   'tailored just for you.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                     color:
//                         Colors.black, // Adjust text color for better visibility
//                   ),
//                 ),
//                 const SizedBox(height: 50),
//                 SizedBox(
//                   width: 300,
//                   height: 70,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //       builder: (context) => const MainPage(),
//                       //     ));
//                     },
//                     child: const Text(
//                       'Get Started',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

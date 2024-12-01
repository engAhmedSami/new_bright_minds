
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';


// class VerfiedEmailViewBody extends StatefulWidget {
//   const VerfiedEmailViewBody({super.key});

//   @override
//   VerfiedEmailViewBodyState createState() => VerfiedEmailViewBodyState();
// }

// class VerfiedEmailViewBodyState extends State<VerfiedEmailViewBody> {
//   late Timer _timer;

//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
//       User? user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         await user.reload();
//         if (user.emailVerified) {
//           timer.cancel();
//           Navigator.of(context).pushReplacementNamed(AuthHandler.routeName);
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Please verify your email address.',
//               style: AppStyles.styleMedium16,
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20),
//             SvgPicture.asset(
//               Assets.imagesConfirmed,
//             ),
//             const SizedBox(height: 20),
//             CustomBotton(
//                 onPressed: () => resendVerificationEmail(context),
//                 text: 'Resend Verification Email'),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> resendVerificationEmail(BuildContext context) async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null && !user.emailVerified) {
//       await user.sendEmailVerification();
//       succesTopSnackBar(context, 'Email verification link has been sent.');
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   const SnackBar(
//       //     content: Text('Email verification link has been sent.'),
//       //   ),
//       // );
//     } else {
//       failuerTopSnackBar(context, 'Unable to send verification email.');
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   const SnackBar(
//       //     content: Text('Unable to send verification email.'),
//       //   ),
//       // );
//     }
//   }
// }

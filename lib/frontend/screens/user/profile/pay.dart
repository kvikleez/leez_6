// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:math' as math;

// class PaymentsAndPayoutsScreen extends StatefulWidget {
//   const PaymentsAndPayoutsScreen({Key? key}) : super(key: key);

//   @override
//   _PaymentsAndPayoutsScreenState createState() => _PaymentsAndPayoutsScreenState();
// }

// class _PaymentsAndPayoutsScreenState extends State<PaymentsAndPayoutsScreen> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   bool _isExpanded = false;
  
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }
  
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: Colors.white,
//             pinned: true,
//             expandedHeight: 180,
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back, color: Colors.black),
//               onPressed: () => Navigator.pop(context),
//             ),
//             flexibleSpace: FlexibleSpaceBar(
//               centerTitle: false,
//               titlePadding: const EdgeInsets.only(left: 50, bottom: 16),
//               title: const Text(
//                 'Payments & Payouts',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//               background: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   Positioned(
//                     right: -50,
//                     top: -20,
//                     child: Transform.rotate(
//                       angle: -math.pi / 8,
//                       child: Container(
//                         width: 200,
//                         height: 200,
//                         decoration: BoxDecoration(
//                           color: Colors.black.withOpacity(0.03),
//                           borderRadius: BorderRadius.circular(40),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     right: 20,
//                     bottom: 60,
//                     child: Transform.rotate(
//                       angle: math.pi / 12,
//                       child: Container(
//                         width: 120,
//                         height: 120,
//                         decoration: BoxDecoration(
//                           color: Colors.black.withOpacity(0.05),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 20,
//                     bottom: 60,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Available Balance',
//                           style: TextStyle(
//                             color: Colors.black54,
//                             fontSize: 14,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           '\$2,450.75',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             bottom: TabBar(
//               controller: _tabController,
//               labelColor: Colors.black,
//               unselectedLabelColor: Colors.black54,
//               indicatorColor: Colors.black,
//               indicatorWeight: 2,
//               tabs: const [
//                 Tab(text: 'PAYMENT METHODS'),
//                 Tab(text: 'PAYOUT METHODS'),
//               ],
//             ),
//           ),
//           SliverFillRemaining(
//             child: TabBarView(
//               controller: _tabController,
//               children: [
//                 _buildPaymentMethodsTab(),
//                 _buildPayoutMethodsTab(),
//               ],
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _tabController.index == 0
//               ? _showAddPaymentMethodBottomSheet(context)
//               : _showAddPayoutMethodBottomSheet(context);
//         },
//         backgroundColor: Colors.black,
//         child: const Icon(Icons.add, color: Colors.white),
//       ),
//     );
//   }

//   Widget _buildPaymentMethodsTab() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildInfoCard(),
//           const SizedBox(height: 24),
          
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'Your payment methods',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {},
//                 child: const Text(
//                   'MANAGE',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ],
//           ),
          
//           const SizedBox(height: 8),
          
//           _buildCreditCard(
//             cardNumber: '**** **** **** 4567',
//             cardholderName: 'Alexander Wilson',
//             expiryDate: '12/25',
//             cardType: 'visa',
//             isDefault: true,
//           ),
          
//           const SizedBox(height: 16),
          
//           _buildCreditCard(
//             cardNumber: '**** **** **** 1234',
//             cardholderName: 'Alexander Wilson',
//             expiryDate: '09/24',
//             cardType: 'mastercard',
//             isDefault: false,
//           ),
          
//           const SizedBox(height: 24),
          
//           const Text(
//             'Recent transactions',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
          
//           const SizedBox(height: 16),
          
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: [
//                 _buildTransactionItem(
//                   title: 'Booking #1234',
//                   subtitle: 'Luxury Suite - 3 nights',
//                   amount: -256.75,
//                   date: 'Mar 2, 2025',
//                   status: 'Completed',
//                 ),
//                 _buildTransactionItem(
//                   title: 'Refund #5678',
//                   subtitle: 'Cancellation - Mountain View',
//                   amount: 124.50,
//                   date: 'Feb 28, 2025',
//                   status: 'Completed',
//                 ),
//                 _buildTransactionItem(
//                   title: 'Booking #9012',
//                   subtitle: 'Beachfront Cottage - 2 nights',
//                   amount: -187.25,
//                   date: 'Feb 23, 2025',
//                   status: 'Completed',
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPayoutMethodsTab() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.grey[50],
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.black12),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Icon(Icons.account_balance, size: 20),
//                     ),
//                     const SizedBox(width: 12),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Next scheduled payout',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.black54,
//                           ),
//                         ),
//                         const SizedBox(height: 2),
//                         const Text(
//                           '\$875.50',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Spacer(),
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                       decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: const Text(
//                         'Mar 8',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         height: 4,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(2),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 4),
//                     Expanded(
//                       flex: 3,
//                       child: Container(
//                         height: 4,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[300],
//                           borderRadius: BorderRadius.circular(2),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 const Text(
//                   'Processing (1 of 4 days)',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ],
//             ),
//           ),
          
//           const SizedBox(height: 24),
          
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'Payout methods',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {},
//                 child: const Text(
//                   'HISTORY',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ],
//           ),
          
//           const SizedBox(height: 16),
          
//           _buildBankAccount(
//             accountName: 'Wells Fargo Checking',
//             accountNumber: '******6789',
//             routingNumber: '072000138',
//             isDefault: true,
//           ),
          
//           const SizedBox(height: 16),
          
//           _buildPayPalAccount(
//             email: 'alexander.wilson@example.com',
//             isDefault: false,
//           ),
          
//           const SizedBox(height: 24),
          
//           const Text(
//             'Payout preferences',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
          
//           const SizedBox(height: 16),
          
//           _buildSettingTile(
//             title: 'Payout schedule',
//             subtitle: 'Weekly (every Monday)',
//             icon: Icons.calendar_today_outlined,
//           ),
          
//           _buildSettingTile(
//             title: 'Minimum payout amount',
//             subtitle: '\$100',
//             icon: Icons.attach_money_outlined,
//           ),
          
//           _buildSettingTile(
//             title: 'Automatic payments',
//             subtitle: 'Enabled for all properties',
//             icon: Icons.repeat_outlined,
//             hasSwitch: true,
//             switchValue: true,
//           ),
          
//           _buildSettingTile(
//             title: 'Payout notifications',
//             subtitle: 'Email and push notifications',
//             icon: Icons.notifications_outlined,
//             hasSwitch: true,
//             switchValue: true,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoCard() {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.black,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               const Icon(
//                 Icons.info_outline,
//                 color: Colors.white,
//                 size: 18,
//               ),
//               const SizedBox(width: 8),
//               const Text(
//                 'Payment information',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//               const Spacer(),
//               InkWell(
//                 onTap: () {
//                   setState(() {
//                     _isExpanded = !_isExpanded;
//                   });
//                 },
//                 child: Icon(
//                   _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//           if (_isExpanded) ...[
//             const SizedBox(height: 12),
//             const Text(
//               'Payments are processed securely through our payment system. Your financial information is encrypted and never stored on our servers.',
//               style: TextStyle(
//                 color: Colors.white70,
//                 fontSize: 14,
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextButton(
//               onPressed: () {},
//               style: TextButton.styleFrom(
//                 padding: EdgeInsets.zero,
//                 alignment: Alignment.centerLeft,
//               ),
//               child: const Text(
//                 'Learn more about our payment security',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w500,
//                   decoration: TextDecoration.underline,
//                 ),
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }

//   Widget _buildCreditCard({
//     required String cardNumber,
//     required String cardholderName,
//     required String expiryDate,
//     required String cardType,
//     required bool isDefault,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: isDefault ? Colors.black : Colors.black12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// class TravelSettingsScreen extends StatefulWidget {
//   const TravelSettingsScreen({Key? key}) : super(key: key);

//   @override
//   _TravelSettingsScreenState createState() => _TravelSettingsScreenState();
// }

// class _TravelSettingsScreenState extends State<TravelSettingsScreen> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   late AnimationController _animationController;
//   late Animation<double> _animation;
  
//   // State variables
//   String _selectedLanguage = 'English (US)';
//   bool _autoTranslate = true;
//   bool _shareLocation = false;
//   bool _shareActivity = true;
//   bool _receivePromotions = false;
//   bool _expenseIntegration = true;
//   bool _workProfile = true;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 2000),
//       vsync: this,
//     )..repeat(reverse: true);
    
//     _animation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOut,
//       ),
//     );
//   }
  
//   @override
//   void dispose() {
//     _tabController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             SliverAppBar(
//               expandedHeight: 200.0,
//               floating: false,
//               pinned: true,
//               backgroundColor: Colors.white,
//               elevation: 0,
//               leading: IconButton(
//                 icon: const Icon(Icons.arrow_back, color: Colors.black),
//                 onPressed: () => Navigator.pop(context),
//               ),
//               flexibleSpace: FlexibleSpaceBar(
//                 centerTitle: false,
//                 titlePadding: const EdgeInsets.only(left: 50, bottom: 16),
//                 title: const Text(
//                   'Travel Settings',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 background: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     // Decorative elements
//                     AnimatedBuilder(
//                       animation: _animation,
//                       builder: (context, child) {
//                         return Positioned(
//                           right: -50 + (10 * _animation.value),
//                           top: -30 + (10 * _animation.value),
//                           child: Transform.rotate(
//                             angle: -math.pi / 8 + (0.05 * _animation.value),
//                             child: Container(
//                               width: 180,
//                               height: 180,
//                               decoration: BoxDecoration(
//                                 color: Colors.black.withOpacity(0.03),
//                                 borderRadius: BorderRadius.circular(40),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                     Positioned(
//                       left: 20,
//                       bottom: 80,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.all(8),
//                             decoration: BoxDecoration(
//                               color: Colors.black.withOpacity(0.05),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: const Icon(
//                               Icons.travel_explore,
//                               color: Colors.black54,
//                               size: 20,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           const Text(
//                             'Customize your travel experience',
//                             style: TextStyle(
//                               color: Colors.black54,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               bottom: TabBar(
//                 controller: _tabController,
//                 labelColor: Colors.black,
//                 unselectedLabelColor: Colors.black38,
//                 indicatorColor: Colors.black,
//                 indicatorWeight: 2,
//                 tabs: const [
//                   Tab(
//                     text: 'TRANSLATION',
//                     icon: Icon(Icons.translate, size: 20),
//                   ),
//                   Tab(
//                     text: 'PRIVACY',
//                     icon: Icon(Icons.privacy_tip_outlined, size: 20),
//                   ),
//                   Tab(
//                     text: 'WORK',
//                     icon: Icon(Icons.work_outline, size: 20),
//                   ),
//                 ],
//               ),
//             ),
//           ];
//         },
//         body: TabBarView(
//           controller: _tabController,
//           children: [
//             _buildTranslationTab(),
//             _buildPrivacyTab(),
//             _buildWorkTab(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTranslationTab() {
//     final languages = [
//       'English (US)',
//       'Spanish',
//       'French',
//       'German',
//       'Italian',
//       'Japanese',
//       'Korean',
//       'Portuguese',
//       'Chinese (Simplified)',
//       'Russian'
//     ];
    
//     return SingleChildScrollView(
//       physics: const BouncingScrollPhysics(),
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildAnimatedCard(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           color: Colors.black.withOpacity(0.05),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: const Icon(Icons.language, size: 20),
//                       ),
//                       const SizedBox(width: 12),
//                       const Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'App Language',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               'Choose the language you see across the app',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.black54,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.05),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: DropdownButtonHideUnderline(
//                       child: DropdownButton<String>(
//                         value: _selectedLanguage,
//                         isExpanded: true,
//                         icon: const Icon(Icons.keyboard_arrow_down),
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         borderRadius: BorderRadius.circular(12),
//                         onChanged: (String? newValue) {
//                           setState(() {
//                             _selectedLanguage = newValue!;
//                           });
//                         },
//                         items: languages.map<DropdownMenuItem<String>>((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           _buildAnimatedCard(
//             child: Column(
//               children: [
//                 _buildSettingTile(
//                   title: 'Auto-translate messages',
//                   subtitle: 'Automatically translate messages in chat',
//                   icon: Icons.translate,
//                   hasSwitch: true,
//                   switchValue: _autoTranslate,
//                   onSwitchChanged: (value) {
//                     setState(() {
//                       _autoTranslate = value;
//                     });
//                   },
//                 ),
//                 const Divider(height: 1),
//                 _buildSettingTile(
//                   title: 'Translate listing descriptions',
//                   subtitle: 'Show listings in your preferred language',
//                   icon: Icons.description_outlined,
//                   hasSwitch: true,
//                   switchValue: true,
//                   onSwitchChanged: (value) {},
//                 ),
//                 const Divider(height: 1),
//                 _buildSettingTile(
//                   title: 'Currency',
//                   subtitle: 'USD - United States Dollar',
//                   icon: Icons.attach_money,
//                   hasSwitch: false,
//                   onTap: () {},
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.grey[50],
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey.withOpacity(0.2)),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Travel Phrasebook',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 const Text(
//                   'Essential phrases for your trips',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.black54,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 AnimatedBuilder(
//                   animation: _animation,
//                   builder: (context, child) {
//                     return Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.05 + (0.01 * _animation.value)),
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(
//                           color: Colors.black.withOpacity(0.1),
//                           width: 0.5,
//                         ),
//                       ),
//                       child: Row(
//                         children: [
//                           const Icon(Icons.favorite, color: Colors.red, size: 16),
//                           const SizedBox(width: 12),
//                           const Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Thank you',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(height: 4),
//                                 Text(
//                                   'Gracias',
//                                   style: TextStyle(
//                                     color: Colors.black54,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const Icon(Icons.volume_up_outlined, size: 20),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       foregroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                     ),
//                     child: const Text('View All Phrases'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPrivacyTab() {
//     return SingleChildScrollView(
//       physics: const BouncingScrollPhysics(),
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildAnimatedCard(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Privacy Controls',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'Manage what you share with other hosts, guests, and the community',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.black54,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           _buildAnimatedCard(
//             child: Column(
//               children: [
//                 _buildSettingTile(
//                   title: 'Location sharing',
//                   subtitle: 'Share approximate location with hosts',
//                   icon: Icons.location_on_outlined,
//                   hasSwitch: true,
//                   switchValue: _shareLocation,
//                   onSwitchChanged: (value) {
//                     setState(() {
//                       _shareLocation = value;
//                     });
//                   },
//                 ),
//                 const Divider(height: 1),
//                 _buildSettingTile(
//                   title: 'Activity status',
//                   subtitle: 'Show when you\'re active on the platform',
//                   icon: Icons.visibility_outlined,
//                   hasSwitch: true,
//                   switchValue: _shareActivity,
//                   onSwitchChanged: (value) {
//                     setState(() {
//                       _shareActivity = value;
//                     });
//                   },
//                 ),
//                 const Divider(height: 1),
//                 _buildSettingTile(
//                   title: 'Marketing preferences',
//                   subtitle: 'Manage promotional emails and notifications',
//                   icon: Icons.mark_email_unread_outlined,
//                   hasSwitch: true,
//                   switchValue: _receivePromotions,
//                   onSwitchChanged: (value) {
//                     setState(() {
//                       _receivePromotions = value;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           _buildAnimatedCard(
//             child: Column(
//               children: [
//                 _buildSettingTile(
//                   title: 'Connected accounts',
//                   subtitle: '2 accounts connected',
//                   icon: Icons.link_outlined,
//                   badge: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: const Text(
//                       '2',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ),
//                   hasSw
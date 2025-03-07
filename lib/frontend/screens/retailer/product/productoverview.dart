// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ProductView extends StatefulWidget {
//   final dynamic imgForProduct;
//   final String productName;
//   final dynamic ratesofproduct;



//   const ProductView( this.imgForProduct, this.productName, this.ratesofproduct, {super.key});@override
//   State<ProductView> createState() => _ProductViewState();
// }

// class _ProductViewState extends State<ProductView> {
//   final PageController _controller = PageController(viewportFraction: 0.8, keepPage: true);
//   int addToCart = 0;
//   int countOfProducts = 1;
//   List<String> sendingtocart =[];
//   List<String> sendingtocart1 =[];
//   List<String> sendingtocart2 =[];
//   int descr = 0, specif = 0, review = 0;
//   int favu = 1;
//   dynamic baImg;
//   dynamic price;
//   String prName = " ";
//   int black = 0, blue = 0, orange = 0, red = 0, white = 0, otherColors = 0;
//   List<String> imagesofproductinprvi=[

//     'assets/red.jpg',
//     'assets/airpodblack.jpg',
//     'assets/airpodblue.jpg',
//     'assets/orange.jpg',
//     'assets/airpodwhite.jpg',



//   ];
//   int indeximagesofproductinprvi=0;

//   @override
//   void initState() {
//     super.initState();
//     prName = widget.productName;
//     baImg = widget.imgForProduct;
//     price=widget.ratesofproduct;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: Container(
//         height: 70,
//         width: 310,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(60),
//           color: Colors.black,
//         ),
//         child: Row(
//           children: [
//             const SizedBox(width: 10),
//             Container(
//               height: 40,
//               width: 130,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(40),
//                 border: Border.all(width: 2, color: Colors.white),
//               ),
//               child: Stack(
//                 children: [
//                   Positioned(
//                     left: 70,
//                     top: 0,

//                     child: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           if (countOfProducts > 0) {
//                             countOfProducts--;
//                           }
//                         });
//                       },
//                       icon: const Icon(Icons.remove, color: Colors.white, size: 31),
//                     ),
//                   ),
//                   Positioned(
//                     left: countOfProducts > 9 ? 43 : 51,
//                     child: Text(
//                       '$countOfProducts',
//                       style: const TextStyle(fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                           fontSize: 25),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 1,
//                     top: 1,
//                     child: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           countOfProducts++;
//                         });
//                       },
//                       icon: const Icon(Icons.add, color: Colors.white, size: 25),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(width: 10),
//             InkWell(
//               onTap: () {
//                 setState(() {
//                   addToCart = addToCart == 0 ? 1 : 0;
//                 });
//               },
//               child: Container(
//                 height: 50,
//                 width: 150,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(39),
//                   color: addToCart == 0 ? Colors.orange : Colors.grey,
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       left: addToCart == 0 ? 19.0 : 8, top: 10),
//                   child: InkWell(
//                     onTap: () async {
//                       setState(() {
//                         sendingtocart.add(prName);
//                         sendingtocart1.add(price);
//                         sendingtocart2.add(baImg);
//                       });
//                       final prefs = await SharedPreferences.getInstance();
//                       await prefs.setStringList('sendingtocart', sendingtocart);
//                       await prefs.setStringList('sendingtocart1', sendingtocart1);
//                       await prefs.setStringList('sendingtocart2', sendingtocart2);
//                     },

//                     child: Text(
//                       addToCart == 0 ? "Add To Cart" : "Added To Cart",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: addToCart == 0 ? Colors.white : Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//           child: Container(
//             height: 35,
//             width: 35,
//             decoration: BoxDecoration(
//               border: Border.all(width: 1,color: Colors.black54),
//               gradient: LinearGradient(
//                 colors: [Colors.purple.withOpacity(0.4), Colors.blue.withOpacity(0.2)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.circular(40),
//               color: Colors.black12,
//             ),
//             child: const Padding(
//               padding: EdgeInsets.only(left: 9.0),
//               child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 26),
//             ),
//           ),
//         ),
//         actions: [
//           Container(
//             height: 50,
//             width: 50,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(40),
//               gradient: LinearGradient(
//                 colors: [Colors.purple.withOpacity(0.4), Colors.blue.withOpacity(0.2)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: const Center(
//               child: Icon(Icons.share_sharp, color: Colors.white, size: 26),
//             ),
//           ),
//           const SizedBox(width: 31),
//           InkWell(
//             onTap: () {
//               setState(() {
//                 favu = favu == 1 ? 0 : 1;
//               });
//             },
//             child: Container(
//               height: 50,
//               width: 50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(40),
//                 gradient: LinearGradient(
//                   colors: [Colors.purple.withOpacity(0.4), Colors.blue.withOpacity(0.2)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: Center(
//                 child: Icon(
//                   favu == 1 ? Icons.favorite_border_outlined : Icons.favorite,
//                   color: Colors.pinkAccent,
//                   size: 27,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//             SizedBox(

//               height: 211,
//               width: double.infinity,
//               child: Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(40),
//                     child: PageView(
//                       scrollDirection: Axis.horizontal,
//                       allowImplicitScrolling: true,
//                       physics: const ClampingScrollPhysics(),
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8.0, right: 7),
//                           child: prName=="Wireless Headphons"?Image.network(imagesofproductinprvi[indeximagesofproductinprvi]):Image.network(baImg, fit: BoxFit.cover),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     top: 80,
//                     left: 391,
//                     child: IconButton(onPressed: (){
//                         setState(() {

//                         });

//                     }, icon: const Icon(Icons.arrow_forward_ios_sharp)),
//                   ),

//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             detailscontainer(),
//           ],
//         ),
//       ),
//     );
//   }


//   Container detailscontainer() {
//     return Container(

//       width: double.infinity,
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.purple.withOpacity(0.4),Colors.blue.withOpacity(0.2)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
//       ),
//       padding: const EdgeInsets.only(

//         top: 20,
//         bottom: 300,
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: prName.length>=10? const EdgeInsets.only(right: 230.0):const EdgeInsets.only(right: 348.0),
//             child: Text(prName,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
//           ),
//           Padding(
//             padding: price.length>3? const EdgeInsets.only(right: 360.0):const EdgeInsets.only(right: 370.0),
//             child: Text(price,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),
//           ),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text("Seller : ",style: TextStyle(fontSize: 20),),
//               Padding(
//                 padding: EdgeInsets.only(right: 8.0),
//                 child: Text('Balaraju🙂',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
//               )
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 8.0),
//             child: Row(
//               children: [
//                 Container(
//                   height: 22,
//                   width: 56,
//                   decoration: BoxDecoration(
//                       color: Colors.orange,
//                       borderRadius: BorderRadius.circular(39)
//                   ),
//                   child: const Row(
//                     children: [
//                       SizedBox(
//                         width: 4,
//                       ),
//                       Icon(Icons.star_sharp,color: Colors.white,size: 18,),
//                       SizedBox(
//                         width: 6,
//                       ),
//                       Text('4.8',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),)
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 const Text("(320 Reviews)",style: TextStyle(color: Colors.white),)
//               ],
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(right: 339.0),
//             child: Text('Colors',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
//           ),
//           Row(//colors
//             children: [
//               InkWell(
//                 onTap: (){
//                   setState(() {
//                     indeximagesofproductinprvi=1;
//                     black=1;
//                     white=0;
//                     blue=0;
//                     orange=0;
//                     red=0;

//                   });
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 9.0),
//                   child: Container(
//                     height: 44,
//                     width: 44,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(39),
//                         color: Colors.black,
//                         border: Border.all(
//                             width: 2,
//                             color: Colors.white70
//                         ),
//                         boxShadow:
//                         [
//                           BoxShadow(
//                             color: Colors.black,

//                             blurRadius: black==1?26.0:0,
//                             spreadRadius: black==1?2.0:0.0,
//                           )
//                         ]
//                     ),


//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 16,
//               ),
//               InkWell(
//                 onTap: () {
//                   setState(() {
//                     black = 0;
//                     white = 0;
//                     indeximagesofproductinprvi=2;
//                     blue = 1;
//                     orange = 0;
//                     red = 0;
//                   });
//                 },
//                 child: Container(
//                   height: 44,
//                   width: 44,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(39),
//                       color: Colors.blueAccent,
//                       border: Border.all(
//                           width: 2,
//                           color: Colors.white70
//                       ),
//                       boxShadow:
//                       [
//                         BoxShadow(
//                           color: Colors.blueAccent,

//                           blurRadius: blue==1?23.0:0,
//                           spreadRadius: blue==1?9:0,
//                         )
//                       ]

//                   ),

//                 ),
//               ),
//               const SizedBox(
//                 width: 16,
//               ),
//               InkWell(
//                 onTap: () {
//                   setState(() {
//                     black = 0;
//                     white = 0;
//                     blue = 0;
//                     indeximagesofproductinprvi=3;
//                     orange = 1;
//                     red = 0;
//                   });
//                 },
//                 child: Container(
//                   height: 44,
//                   width: 44,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(39),

//                       color: Colors.orange,
//                       border: Border.all(
//                           width: 2,
//                           color: Colors.white70
//                       ),



//                       boxShadow:
//                       [
//                         BoxShadow(
//                           color: Colors.orange,

//                           blurRadius: orange==1?26.0:0,
//                           spreadRadius: orange==1?1.0:0,
//                         )
//                       ]

//                   ),

//                 ),
//               ),
//               const SizedBox(
//                 width: 16,
//               ),

//               InkWell(
//                 onTap: (){
//                   setState(() {
//                     indeximagesofproductinprvi=4;

//                     otherColors=1;
//                   });
//                 },
//                 child: otherColors==0?othercolrs():othercolrs1(),),



//             ],
//           ),
//           const SizedBox(height: 20,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [

//               InkWell(
//                 onTap: (){
//                   setState(() {
//                     review=0;
//                     descr=1;
//                     specif=0;
//                   });
//                 },
//                 child: Container(

//                   height: 40,
//                   width: 130,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20)
//                       ,
//                       color: descr==1?Colors.orange:Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                             offset: descr==1?const Offset(0, 0):const Offset(0, 0),
//                             blurRadius: descr==1?2:0,

//                             color: Colors.black
//                         )
//                       ]
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 13.0,top: 6),
//                     child: Text("Description",style: TextStyle(color: descr==1?Colors.white:Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 19),),
//                   ),
//                 ),
//               ),

//               InkWell(
//                 onTap: (){
//                   setState(() {
//                     review=0;
//                     descr=0;
//                     specif=1;
//                   });
//                 },
//                 child: Container(
//                   height: 40,
//                   width: 140,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20)
//                       ,
//                       color: specif==1?Colors.orange:Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                             offset: specif==1?const Offset(0, 0):const Offset(0, 0),
//                             blurRadius: specif==1?7:0,

//                             color: Colors.black
//                         )
//                       ]
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 12.0,top: 6),
//                     child: Text("Specification",style: TextStyle(color: specif==1?Colors.white:Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 19),),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: (){
//                   setState(() {
//                     review=1;
//                     descr=0;
//                     specif=0;
//                   });
//                 },
//                 child: Container(
//                   height: 40,
//                   width: 140,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20)
//                       ,
//                       color: review==1?Colors.orange:Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                             offset: review==1?const Offset(0, 0):const Offset(0, 0),
//                             blurRadius: review==1?7:0,

//                             color: Colors.black
//                         )
//                       ]
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 34.0,top: 4),
//                     child: Text("Reviews",style: TextStyle(color: review==1?Colors.white:Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 21),),
//                   ),
//                 ),
//               ),
//             ],

//           ),
//           const SizedBox(
//             height: 30,
//           ),


//     descr == 1
//     ? description1()
//         : specif==1
//     ? specification()
//         : review==1
//     ? getEarbudsReviews()
//         : description1(),





//         ],
//       ),

//     );
//   }
//   Container getEarbudsReviews() {
//     return Container(
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         borderRadius: BorderRadius.circular(12),

//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Reviews',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 22,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(height: 15),
//           ..._buildReviewItems(),
//         ],
//       ),
//     );
//   }

//   List<Widget> _buildReviewItems() {
//     return [
//       reviewItem(
//         name: 'John Doe',
//         rating: 5,
//         comment: '🎧 Amazing sound quality and battery life! Highly recommend these earbuds.',
//       ),
//       reviewItem(
//         name: 'Jane Smith',
//         rating: 4,
//         comment: '👍 Comfortable fit and excellent noise cancellation. Worth the price.',
//       ),
//       reviewItem(
//         name: 'Sam Wilson',
//         rating: 3,
//         comment: '⚡ Good earbuds, but the connectivity can be inconsistent at times.',
//       ),
//       reviewItem(
//         name: 'Emily Davis',
//         rating: 5,
//         comment: '🎵 Best earbuds I have ever used! The sound clarity is fantastic.',
//       ),
//       reviewItem(
//         name: 'Michael Brown',
//         rating: 4,
//         comment: '💰 Great value for money. The touch controls are very responsive.',
//       ),
//     ];
//   }

//   Widget reviewItem({required String name, required int rating, required String comment}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Text(
//                 name,
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//               const SizedBox(width: 8),
//               ...List.generate(rating, (index) => const Icon(Icons.star, color: Colors.orange, size: 18)),
//               ...List.generate(5 - rating, (index) => const Icon(Icons.star_border, color: Colors.orange, size: 18)),
//             ],
//           ),
//           const SizedBox(height: 5),
//           Text(
//             comment,
//             style: const TextStyle(color: Colors.black87, fontSize: 14),
//           ),
//           const SizedBox(height: 10),
//           Divider(color: Colors.grey[300], thickness: 1),
//         ],
//       ),
//     );
//   }




//   Container specification() {
//     return Container(
//       padding: const EdgeInsets.only(top: 20, bottom: 20),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.purple.withOpacity(0.3), Colors.black.withOpacity(0.5)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             borderRadius: BorderRadius.circular(15),
//             border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Text(
//                 'Highlights',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 33,
//                   color: Colors.white,
//                   shadows: [
//                     Shadow(
//                       blurRadius: 10.0,
//                       color: Colors.orangeAccent,
//                       offset: Offset(0, 0),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10),
//               _highlightItem('Type: Wireless Earbuds 🎧'),
//               _highlightItem('Battery Life: Up to 24 hours 🔋'),
//               _highlightItem('Connectivity: Bluetooth 5.0 📶'),
//               _highlightItem('Water Resistance: IPX5 💧'),
//               _highlightItem('Charging Time: 1.5 hours ⚡'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _highlightItem(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5.0),
//       child: Row(
//         children: [
//           Container(
//             height: 12,
//             width: 12,
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.orange,
//               boxShadow: [
//                 BoxShadow(
//                   blurRadius: 5,
//                   spreadRadius: 2,
//                   color: Colors.orangeAccent,
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(
//                 fontWeight: FontWeight.normal,
//                 fontSize: 18,
//                 color: Colors.white70,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   Padding description1() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 17.0, right: 17.0),
//       child: Container(
//         // Apply a backdrop filter to the container
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
//           child: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.purple.withOpacity(0.3), Colors.black.withOpacity(0.5)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.circular(15),
//               border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
//             ),
//             padding: const EdgeInsets.all(16.0),
//             child: const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'What matters for you💥',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 33,
//                     color: Colors.white,
//                     shadows: [
//                       Shadow(
//                         blurRadius: 10.0,
//                         color: Colors.orangeAccent,
//                         offset: Offset(0, 0),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 27,
//                 ),
//                 Text(
//                   '🎧 Discover the ultimate listening experience with our Wireless Earbuds! 🎵\n\n'
//                       '• Crystal clear sound quality 🔊\n'
//                       '• Ergonomic and comfortable design for all-day wear 👂\n'
//                       '• Long-lasting battery life 🔋\n'
//                       '• Seamless Bluetooth connectivity 📶\n'
//                       '• Noise-cancelling technology for uninterrupted listening 🚫🔊\n\n'
//                       'Perfect for music lovers, gamers, and professionals on the go! 🌟',
//                   style: TextStyle(fontSize: 16, color: Colors.white70),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }








//   Row othercolrs1() {
//     return Row(//other colors
//       children: [
//         InkWell(
//           onTap: (){
//             setState(() {
//               black=0;
//               white=0;
//               blue=0;
//               orange=0;
//               red=1;

//             });
//           },
//           child: Container(
//             height: 44,
//             width: 44,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(39),
//                 color: Colors.red,
//                 border: Border.all(
//                     width: 2,
//                     color: Colors.white70
//                 ),
//                 boxShadow:
//                 [
//                   BoxShadow(
//                     color: Colors.red,

//                     blurRadius: red==1?26.0:0,
//                     spreadRadius: red==1?2.0:0.0,
//                   )
//                 ]
//             ),


//           ),
//         ),
//         const SizedBox(
//           width: 16,
//         ),
//         InkWell(
//           onTap: () {
//             setState(() {
//               black = 0;
//               white = 1;
//               blue = 0;
//               orange = 0;
//               red = 0;
//             });
//           },
//           child: Container(
//             height: 44,
//             width: 44,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(39),
//                 color: Colors.white,
//                 border: Border.all(
//                     width: 2,
//                     color: Colors.black
//                 ),
//                 boxShadow:
//                 [
//                   BoxShadow(
//                     color: Colors.white,

//                     blurRadius: white==1?23.0:0,
//                     spreadRadius: white==1?9:0,
//                   )
//                 ]

//             ),

//           ),
//         ),

//       ],
//     );
//   }

//   Container othercolrs() {
//     return Container(
//       height: 44,
//       width: 44,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(39),
//           gradient:const LinearGradient(colors: [
//             Colors.red,
//             Colors.white60

//           ]),
//           border: Border.all(
//               width: 2,
//               color: Colors.black12
//           )
//       ),
//       child: const Padding(
//         padding: EdgeInsets.only(left: 8.0,top: 6),
//         child: Text('+2',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
//       ),

//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductView extends StatefulWidget {
  final String imgForProduct;
  final String productName;
  final String ratesofproduct;
  final String description;
  final bool isPremium;

  const ProductView({
    super.key, 
    required this.imgForProduct, 
    required this.productName, 
    required this.ratesofproduct,
    this.description = "Handcrafted from premium materials, this sophisticated product features a spacious interior with multiple compartments. Perfect for both professional and casual occasions.",
    this.isPremium = true,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  bool isAvailable = true;
  bool isFavorite = false;
  
  // Stats data
  final int totalReach = 2847;
  final int totalClicks = 426;
  final int requests = 64;
  final double engagement = 15.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                backgroundColor: Colors.white, // <--- Add this line
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Product Details', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black),
            onPressed: () {
              // Edit action
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.black),
            onPressed: () {
              // Delete action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: Image.network(
                  widget.imgForProduct,
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
              
              // Pagination Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [1, 2, 3].map((i) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                  width: i == 1 ? 12 : 8,
                  height: i == 1 ? 12 : 8,
                  decoration: BoxDecoration(
                    color: i == 1 ? Colors.black : Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                )).toList(),
              ),
              
              // Product Title
              Text(
                widget.productName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              // Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${widget.ratesofproduct}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      // Availability Switch
                      Text(
                        'Availability',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      Switch(
                        value: isAvailable,
                        onChanged: (value) {
                          setState(() {
                            isAvailable = value;
                          });
                        },
                        activeColor: Colors.black,
                      ),
                      
                      // Boost Product Button
                      ElevatedButton.icon(
                        onPressed: () {
                          // Boost product action
                        },
                        icon: const Icon(Icons.favorite, color: Colors.white),
                        label: const Text('Boost Product'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              // Collection Tag
              const SizedBox(height: 8),
              Text(
                widget.isPremium ? 'Premium Collection' : 'Standard Collection',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              
              // Tags
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('Luxury', style: TextStyle(fontSize: 12)),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('New', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
              
              // Product Description
              const SizedBox(height: 16),
              Text(
                widget.description,
                style: TextStyle(
                  color: Colors.grey[800],
                  height: 1.5,
                ),
              ),
              
              // Performance Metrics Section
              const SizedBox(height: 30),
              const Text(
                'Performance Metrics',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              // Reach and Clicks
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildMetricItem(
                      Icons.visibility,
                      'Total Reach',
                      totalReach.toString(),
                    ),
                  ),
                  Expanded(
                    child: _buildMetricItem(
                      Icons.touch_app,
                      'Total Clicks',
                      totalClicks.toString(),
                      alignment: CrossAxisAlignment.end,
                      iconAlignment: MainAxisAlignment.end,
                    ),
                  ),
                ],
              ),
              
              // Requests and Engagement
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _buildMetricItem(
                      Icons.message,
                      'Requests',
                      requests.toString(),
                    ),
                  ),
                  Expanded(
                    child: _buildMetricItem(
                      Icons.bar_chart,
                      'Engagement',
                      '$engagement%',
                      alignment: CrossAxisAlignment.end,
                      iconAlignment: MainAxisAlignment.end,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    // Add to cart logic
                    final prefs = await SharedPreferences.getInstance();
                    
                    List<String> names = prefs.getStringList('sendingtocart') ?? [];
                    List<String> prices = prefs.getStringList('sendingtocart1') ?? [];
                    List<String> images = prefs.getStringList('sendingtocart2') ?? [];
                    
                    names.add(widget.productName);
                    prices.add(widget.ratesofproduct);
                    images.add(widget.imgForProduct);
                    
                    await prefs.setStringList('sendingtocart', names);
                    await prefs.setStringList('sendingtocart1', prices);
                    await prefs.setStringList('sendingtocart2', images);
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added to cart!'))
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Add to Cart', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildMetricItem(IconData icon, String label, String value, {
    CrossAxisAlignment alignment = CrossAxisAlignment.start,
    MainAxisAlignment iconAlignment = MainAxisAlignment.start,
  }) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Row(
          mainAxisAlignment: iconAlignment,
          children: [
            Icon(icon, size: 16, color: Colors.grey[600]),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
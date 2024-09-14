// // ignore_for_file: unnecessary_null_comparison

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';

// import '../../controller/FloatingController.dart';
// import '../../data/datasource/bg_data.dart';
// import '../../data/model/product_model.dart';
// import '../widget/custom_card.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});

//   final FloatingController controller =
//       Get.put(FloatingController(), permanent: true);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               onPressed: () {}, icon: const Icon(FontAwesomeIcons.cartPlus))
//         ],
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           'ALL Products',
//           style: Theme.of(context).textTheme.headlineMedium,
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.only(top: 15),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(bgList[controller.selectedIndex]),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: FutureBuilder<List<ProductModel>>(
//             future: AllProductsService().getAllProducts(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 List<ProductModel> product = snapshot.data!;
//                 return GridView.builder(
//                   itemCount: product.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 1.7,
//                       crossAxisSpacing: 5,
//                       mainAxisSpacing: 30,
//                       mainAxisExtent: 165),
//                   itemBuilder: (context, i) {
//                     return CustomCard(product: product[i]);
//                   },
//                 );
//               } else {
//                 return const Center(child: CircularProgressIndicator());
//               }
//             }),
//       ),
//     );
//   }
// }

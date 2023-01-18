import 'package:flutter/material.dart';
import 'package:flutter_restapi/controller/product_controller.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Flutter RestAPI",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Rest API'),),
        body: Obx((){
          if (controller.isLoading.value){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              padding: const EdgeInsets.only(top: 5, left: 16, right: 16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 280),
                itemBuilder: (context, index) {
                  final idx = index <= controller.products.length -1
                      ? index :
                      controller.products.length -1;
                  final product = controller.products[idx];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Image.network(
                              product.thumbnail,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container( 
                          margin: const EdgeInsets.all(10),
                          width: Size.infinite.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.category,
                                style: TextStyle(color: Colors.blue),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                product.title,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                '\$${product.price}',
                                style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 14
                                  ),
                                  const SizedBox(width: 6,),
                                  Text(
                                    '${product.rating} | Stock ${product.stock}',
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black87),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          }

        }),
      ),
    );
  }
}
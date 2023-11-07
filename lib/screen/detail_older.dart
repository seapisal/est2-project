import 'package:flutter/material.dart';
import 'package:est2/models/url_models.dart';
import 'package:est2/screen/home_page.dart';
import 'package:est2/widgets/valuelisionble_notifier.dart';

// ignore: camel_case_types, must_be_immutable
class detail_older extends StatelessWidget {
  const detail_older({
    super.key,
    required this.product,
  });

  final urlProduct product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.nameShop,
          style: const TextStyle(color: Colors.amber),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          height: 120,
                          width: 190,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.deepPurple,
                              image: DecorationImage(
                                  image: NetworkImage(product.imageUrl),
                                  fit: BoxFit.cover),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade900,
                                  blurRadius: 5,
                                )
                              ]),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            //MediaQuery.of(context).size.height ,
                            height: 60,
                            width: 165,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    bottomLeft: Radius.circular(50)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade900,
                                    blurRadius: 5,
                                  )
                                ]),
                            child: Center(
                                child: Text(
                                  product.textUrl,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      color: Colors.amber,
                                      shadows: [
                                        BoxShadow(color: Colors.black87, blurRadius: 7)
                                      ]),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Container(
                              //MediaQuery.of(context).size.height ,
                              height: 50,
                              width: 140,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(100),
                                      bottomLeft: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade900,
                                        blurRadius: 2,
                                        offset: const Offset(-1.0, 1.5))
                                  ]),
                              child: Center(
                                  child: Text(
                                    product.priceUrl,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.black87, blurRadius: 3)
                                        ]),
                                  )),
                            ),
                          ),
                        ],
                      )
                      // Text(product.textUrl,style: TextStyle(fontSize: 35,color: Colors.amber,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Stack(
                    children: [
                      Center(
                        child: ValueListenableBuilder(
                          valueListenable: counterNotifier,
                          builder: (context, value, child) {
                            return Text(
                              '0${counterNotifier.value}',
                              style: const TextStyle(
                                color: Colors.amber,
                                fontSize: 180,
                              ),
                            );

                            // if (counterNotifier.value <= 10) {
                            //   Text(
                            //     '${counterNotifier.value}',
                            //     style: const TextStyle(
                            //       color: Colors.amber, fontSize: 200,),
                            //   );
                            // } else if (value >= 10) {
                            //   Text(
                            //     '0${counterNotifier.value}',
                            //     style: const TextStyle(
                            //       color: Colors.amber, fontSize: 200,),
                            //   );
                            // }
                          },
                        ),
                      ),
                      const Positioned(
                        right: 15,
                        bottom: 45,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '/',
                              style: TextStyle(color: Colors.amber, fontSize: 30),
                            ),
                            Text(
                              ' QTY',
                              style: TextStyle(color: Colors.amber, fontSize: 19),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )),
          Expanded(
            flex: 7,
              child: Container(
                // color: Colors.amber,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 15,
                          color: Colors.black26,
                          offset: Offset(0.0, 0.0))
                    ]),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()));
          shoppingNotifier.value++;
          counterNotifier.value = 1;
        },
        backgroundColor: Colors.grey.shade900,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Colors.amber, width: 1)),
        child: const Icon(
          Icons.push_pin_outlined,
          color: Colors.amber,
        ),
      ),
    );
  }
}

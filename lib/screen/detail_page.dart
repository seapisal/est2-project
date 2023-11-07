import 'package:est2/models/url_models.dart';
import 'package:est2/screen/detail_older.dart';
import 'package:est2/widgets/valuelisionble_notifier.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class detailPage extends StatefulWidget {
  final urlProduct product;

  // ignore: prefer_typing_uninitialized_variables
  final nameShop;

   const detailPage({
    super.key,
    required this.product, this.nameShop,

  });


  @override
  State<detailPage> createState() => _detailPageState();
}

// ignore: camel_case_types
class _detailPageState extends State<detailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.nameShop,
          style: const TextStyle(color: Colors.amber),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.map)),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: NetworkImage(widget.product.imageUrl),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 20),
                      child: Container(
                        //MediaQuery.of(context).size.height ,
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade900,
                                  blurRadius: 5,
                                  offset: const Offset(0.0, 0.0))
                            ]),
                        child: Center(
                            child: Text(
                          widget.product.priceUrl,
                          style: const TextStyle(
                              fontSize: 17,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    left: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 20),
                      child: Container(
                        //MediaQuery.of(context).size.height ,
                        height: 50,
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade900,
                                blurRadius: 3,
                              )
                            ]),
                        child: Center(
                            child: Text(
                          widget.product.textUrl,
                          style: const TextStyle(
                              fontSize: 17, color: Colors.amber),
                        )),
                      ),
                    ),
                  )
                ],
              )),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 6,
                      spreadRadius: 1.0)
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                      bottom: 40,
                      left: 40,
                      child: Row(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {

                                    counterNotifier.value --;
                                    if (counterNotifier.value <= 1){
                                      counterNotifier.value = 1;
                                    }

                                  },
                                  icon: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: const BoxDecoration(
                                          color: Colors.black26),
                                      child: const Icon(Icons.remove))),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ValueListenableBuilder(
                                  valueListenable: counterNotifier,
                                  builder: (context,value, child){
                                    return Text(
                                      '${counterNotifier.value}',
                                    );
                                  },
                                ),
                                  // Text("${widget.product.buyCounter}")
                              ),
                              IconButton(
                                  onPressed: () {

                                    counterNotifier.value ++;


                                  },
                                  icon: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: const BoxDecoration(
                                          color: Colors.black26),
                                      child: const Icon(Icons.add))),
                            ],
                          ),
                          const SizedBox(
                            width: 155,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => detail_older(
                                    product: widget.product,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              //MediaQuery.of(context).size.height ,
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Center(
                                  child: Text(
                                "Buy",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

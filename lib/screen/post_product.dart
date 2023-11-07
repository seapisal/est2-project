import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class postProduce extends StatefulWidget {
  const postProduce({super.key});

  @override
  State<postProduce> createState() => _postProduceState();
}

class _postProduceState extends State<postProduce> {

  final _controllerNameProduce = TextEditingController();
  final _controllerPriceProduce = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POST-PRODUCT",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
              child: Center(
                child: Container(
            color: Colors.amber,
          ),
              )),
          Expanded(
            flex: 3,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        height: 70,
                        width: 250,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.amber,width: 1,),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child:  Center(
                          child: TextField(
                            controller: _controllerNameProduce,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    _controllerNameProduce.clear();
                                  },
                                  icon: Icon(Icons.clear,color: Colors.amber.shade900,)),
                                hintText: 'Name Product',
                                hintStyle: TextStyle(color: Colors.amber.withOpacity(0.4),),
                                prefixIcon: const Icon(Icons.bookmark_added,color: Colors.amber,)),
                            )
                            ),
                        ),

                      Container(
                        height: 70,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.amber,width: 1,),
                        ),
                        child: Center(
                          child: TextField(
                            controller: _controllerPriceProduce,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      _controllerPriceProduce.clear();
                                    },
                                    icon: Icon(Icons.clear,color: Colors.amber.shade900,)),
                                hintText: 'Price',
                                hintStyle: TextStyle(color: Colors.amber.withOpacity(0.4),),
                                prefixIcon: const Icon(Icons.attach_money_outlined,color: Colors.amber,)
                              ,)
                                // prefixIcon: const Icon(Icons.bookmark_added,color: Colors.amber,)
                            ),
                          ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.grey.shade800,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 1,
                            color: Colors.grey.shade400,
                          )
                        ]
                      ),
                      child: Center(child: Text('Drone',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}

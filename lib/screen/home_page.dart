import 'package:est2/constants/product.dart';
import 'package:est2/screen/detail_page.dart';
import 'package:est2/screen/detail_shopping.dart';
import 'package:est2/screen/post_product.dart';
import 'package:est2/widgets/valuelisionble_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();

  String nameShop = "Chanda foods";
  bool _favorithId = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Text(
          nameShop,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10,),
            child: Container(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const DetailShopping()),);
                      shoppingNotifier.value = 0;
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                  Positioned(
                    bottom: 27,
                    right: 5,
                    child: CircleAvatar(
                      radius: 9,
                      backgroundColor: Colors.red,
                      child: Center(
                        child: ValueListenableBuilder(
                          valueListenable: shoppingNotifier,
                          builder: (context, value, child) {
                            return Text(
                              "${shoppingNotifier.value}",
                              style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            );
                          },
                        ),
                        //
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 15, left: 15, right: 15, bottom: 32),
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                          hintText: 'search for restaurant or foods',
                          helperStyle: const TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                width: 0.8, color: Colors.amber),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                width: 0.8, color: Colors.green),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                _textController.clear();
                              },
                              icon: const Icon(Icons.clear)),
                          prefixIcon: const Icon(Icons.search)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.color_lens_outlined,
                                  color: Colors.amber,
                                  size: 30,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Vegetables',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.menu_outlined,
                                  color: Colors.amber,
                                  size: 35,
                                )),
                            const SizedBox(width: 7,),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.menu_book,
                                    color: Colors.amber, size: 33)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
          Expanded(
              flex: 7,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: MasonryGridView.builder(
                      itemCount: product.length,
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => detailPage(
                                                    nameShop: nameShop,
                                                    product: product[index],
                                                  )));
                                    },
                                    child: Image(
                                      image:
                                          NetworkImage(product[index].imageUrl),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Positioned(
                                  right: 5,
                                  top: 5,
                                  child: Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade800,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _favorithId = !_favorithId;
                                          });
                                        },
                                        icon: _favorithId
                                            ? const Icon(
                                                Icons.favorite,
                                                color: Colors.amber,
                                                size: 20,
                                              )
                                            : const Icon(
                                                Icons.favorite_border,
                                                color: Colors.amber,
                                                size: 20,
                                              )),
                                  )),
                            ],
                          ))))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const postProduce()));
        },
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.amber.shade400, width: 1),
        ),
        backgroundColor: Colors.grey.shade800,
        child: const Icon(
          Icons.add,
          color: Colors.amber,
          size: 30,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../constants.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  int selectedCategory = 0;
  bool isSelected = false;
  List<String> categories = ["In Theatre","Box Office","Coming Soon"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context,index) =>
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(selectedCategory != index){
                      isSelected = true;
                      selectedCategory = index;
                      //print(selectedCategory);
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(categories[index],
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.w600,
                            color: selectedCategory == index ? kTextColor : Colors.black.withOpacity(0.3)
                        ),

                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        height: 5.0,
                        width: 50,
                        decoration: BoxDecoration(
                            color: selectedCategory == index ? kSecondaryColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ],
                  ),
                ),
              )
      ),
    );
  }
}


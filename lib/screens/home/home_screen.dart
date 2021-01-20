import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_ui/components/body.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          padding: EdgeInsets.only(left: 10.0),
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: (){},
        ),
        actions: [
          IconButton(
              icon: SvgPicture.asset("assets/icons/search.svg"),
              onPressed: (){},
            padding: EdgeInsets.only(right: 10.0),
          ),

        ],
      ),
      body: Body(),
    );
  }
}

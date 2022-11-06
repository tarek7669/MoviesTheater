import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color_consts.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        toolbarHeight: 81,
        backgroundColor: backColor,
        centerTitle: true,
        elevation: 0,
        title: Text("Checkout",
          style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
      bottomNavigationBar: InkResponse(
        onTap: (){},
        child: Container(
          height: 75,
          color: primaryColor,
          child: Center(
              child: Text("Pay Now",
                style: GoogleFonts.getFont('Roboto', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24),
              )
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
          width: size.width * 0.7,
            height: 1,
            color: primaryColor,
          ),
        ]
      ),
    );
  }
}

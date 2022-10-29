import 'package:flutter/material.dart';
import 'package:movies_theater/ColorConsts.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backColor,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/images/spidermanTrailer.png", width: size.width,fit: BoxFit.fill, height: size.height * 0.35,),
              InkResponse(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(size.width * 0.04, size.height * 0.05, 0, 0),
                  child: Icon(Icons.arrow_back_rounded, color: Colors.white, size: 35,)
                ),
              ),
              Container(
                height: size.height * 0.04,
                width: size.width,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Text("Spiderman No Way Home",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Icon(Icons.play_circle_outline_rounded, color: Colors.white, size: 35,)
              )
            ],
          )
        ],
      ),
    );
  }
}

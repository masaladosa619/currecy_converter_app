import 'package:flutter/material.dart';

class CurrecnyConverterMaterialpage extends StatefulWidget {
  const CurrecnyConverterMaterialpage({super.key});
  @override
  State<CurrecnyConverterMaterialpage> createState() =>
      _CurrecnyConverterMaterialpagestate();
}

class _CurrecnyConverterMaterialpagestate
    extends State<CurrecnyConverterMaterialpage> {
  double result = 0;
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    //agr koi fxn ya command ko ek hi baar run karwana hai not every time the ui is refreshed we use init state
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Ye border TextField ke border ke liye banaya gaya hai
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0, // ✅ Border ki motai (thickness)
        style: BorderStyle.solid, // ✅ Line ka style — solid rakha hai
        strokeAlign: BorderSide
            .strokeAlignOutside, // ✅ Border screen ke bahar ki side aligned hoga
      ),
      borderRadius: BorderRadius.all(Radius.circular(70)), // ✅ Rounded corners
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "currency converter",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey, // ✅ Puri screen ka background color
      body: Center(
        // ✅ Center karta hai poora Column ko screen ke beech mein
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // ✅ Vertical center alignment
          children: [
            // ✅ Ye text hamesha 0 dikhayega — output ya result jaisa
            Text(
              'INR  ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
              style: TextStyle(
                fontSize: 55, // ✅ Text size
                fontWeight: FontWeight.bold, // ✅ Bold font
                color: Colors.white, // ✅ White color text
              ),
            ),

            // ✅ Ye TextField input ke liye use hota hai (user USD value input karega)
            Padding(
              //container is similar to that of padding
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: textEditingController,
                style: TextStyle(
                  color: Colors.black,
                ), // ✅ Jo user type kare uska color
                decoration: InputDecoration(
                  hintText:
                      "Please enter the amount in USD", // ✅ Placeholder jab box empty ho
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ), // ✅ Hint ka text color
                  prefixIcon: Icon(
                    Icons.monetization_on_outlined,
                  ), // ✅ Icon inside input box
                  prefixIconColor: Colors.black, // ✅ Icon ka color
                  filled: true, // ✅ Background fill hoga ya nahi
                  fillColor:
                      Colors.white, // ✅ Input box ka background white rakha hai
                  focusedBorder:
                      border, // ✅ Jab user type kare tab border ka style
                  enabledBorder:
                      border, // ✅ Jab user type nahi kar raha tab ka border
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ), // ✅ Ye line TextField ko close karti hai
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = (double.parse(textEditingController.text) * 81);
                  });
                },
                style: TextButton.styleFrom(
                  elevation: 15,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("convert"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

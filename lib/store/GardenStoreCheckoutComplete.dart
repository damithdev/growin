import 'package:flutter/material.dart';

class GardenStoreCheckoutComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text("",style: TextStyle(fontSize: 17),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: ((){
            Navigator.of(context).pop();
          }),
        ),
      ),
      body: SingleChildScrollView( 

      ),
    );
  }
}

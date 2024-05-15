import 'package:cached_network_image/cached_network_image.dart';
import 'package:doodle_blur_task/model/business_response_model.dart';
import 'package:flutter/material.dart';

class BusinessDetails extends StatefulWidget {
  BusinessResponseModel model;
  BusinessDetails({super.key, required this.model});

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Business Details"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: CachedNetworkImage(imageUrl: widget.model.image),
          ),

          const SizedBox(height: 10,),

          Text(
            widget.model.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17
            ),
          ),

          const SizedBox(height: 10,),

          Text(
            "Price: ${widget.model.price}",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 17
            ),
          ),

          const SizedBox(height: 10,),

          Text(
            widget.model.description,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 15
            ),
          ),

        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:project_dio_bloc/models/post_model.dart';
import '../models/post_model.dart';
import 'item_of_post.dart';

Widget viewOfHome(List<Post> items, bool isLoading){
  return Stack(
    children: [
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return itemOfPost(items[index]);
        },
      ),
      isLoading
          ?
      const Center(
        child: CircularProgressIndicator(),
      )
          :
      const SizedBox.shrink(),
    ],
  );
}
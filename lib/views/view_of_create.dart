import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocks/create_post_cubit.dart';
import '../models/post_model.dart';

Widget viewOfCreate(bool isLoading, BuildContext context, TextEditingController nameController, TextEditingController phoneController){
  return Container(
    padding: const EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                  hintText: "Phone",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                Post post = Post(title: nameController.text.toString(), body: phoneController.text.toString());
                BlocProvider.of<CreatePostCubit>(context).apiPostCreate(post);
              },
              color: Colors.blue,
              child: const Text(
                "Create a Contact",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),

        isLoading ? const Center(
          child: CircularProgressIndicator(),
        ): const SizedBox.shrink(),
      ],
    ),
  );
}
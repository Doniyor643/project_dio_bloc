import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocks/update_post_cubit.dart';
import '../models/post_model.dart';

Widget viewOfUpdate(bool isLoading, BuildContext context,Post post,TextEditingController nameController, TextEditingController phoneController){
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
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<UpdatePostCubit>(context).apiPostUpdate(post);
              },
              child: const Text(
                "Update a Contact",
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
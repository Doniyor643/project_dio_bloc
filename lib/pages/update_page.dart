import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocks/update_post_cubit.dart';
import '../blocks/update_post_state.dart';
import '../models/post_model.dart';
import '../views/view_of_update.dart';


class UpdatePage extends StatefulWidget {
  final Post post;
  const UpdatePage({required this.post,Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.post.title;
    phoneController.text = widget.post.body;

    return BlocProvider(
      create: (context) => UpdatePostCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Update a Post"),
        ),
        body: BlocBuilder<UpdatePostCubit, UpdatePostState>(
          builder: (BuildContext context, UpdatePostState state) {
            if(state is UpdatePostLoading){
              String name = nameController.text.toString();
              String phone = phoneController.text.toString();
              Post post = Post(id: widget.post.id,title: name, body: phone);
              return viewOfUpdate(true,context,post, nameController, phoneController);
            }
            if(state is UpdatePostLoaded){
              _finish(context);
            }
            if(state is UpdatePostError){

            }
            return viewOfUpdate(false,context,widget.post, nameController, phoneController);
          },
        ),
      ),
    );
  }
}

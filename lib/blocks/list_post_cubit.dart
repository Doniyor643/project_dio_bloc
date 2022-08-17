import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/post_model.dart';
import '../pages/create_page.dart';
import '../pages/update_page.dart';
import '../services/http_service.dart';
import 'list_post_state.dart';

class ListPostCubit extends Cubit<ListPostState> {
  ListPostCubit() : super(ListPostInit());

  void apiPostList() async {
    emit(ListPostLoading());
    final response = await DioService().getResponse();
    print(response);
    if (response != null) {
      emit(ListPostLoaded(posts: DioService().getResponse(), isDeleted: false));
    } else {
      emit(ListPostError(error: "Couldn't fetch posts"));
    }
  }

  void apiPostDelete(Post post) async {
    emit(ListPostLoading());
    final response = await DioService().deleteUser(post);
    print("response =====> $response");
    if (response != null) {
      apiPostList();
    } else {
      emit(ListPostError(error: "Couldn't delete post"));
    }
  }

void callCreatePage(BuildContext context) async {
  var results = await Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const CreatePage()));
  if (results != null) {
    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }
}

void callUpdatePage(BuildContext context,Post post) async {
  print(post.toJson());
  var results = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => UpdatePage(
        post: post,
      )));
  if (results != null) {
    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }
}

}
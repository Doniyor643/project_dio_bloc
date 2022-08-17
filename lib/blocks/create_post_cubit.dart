import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/post_model.dart';
import '../services/http_service.dart';
import 'create_post_state.dart';


class CreatePostCubit extends Cubit<CreatePostState>  {
  CreatePostCubit() : super(CreatePostInit());


  void apiPostCreate(Post post) async{
    print(post.toJson());
    emit(CreatePostLoading());
    final response = await DioService().getResponse();
    print(response);
    if (response != null) {
      emit(CreatePostLoaded(isCreated: true));
    } else {
      emit(CreatePostError(error: "Couldn't create post"));
    }
  }
}
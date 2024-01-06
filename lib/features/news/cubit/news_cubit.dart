import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seccion6/core/news_model/news_model.dart';
import 'package:seccion6/core/services/api_services.dart';
import 'package:seccion6/features/news/cubit/news_states.dart';

class newsCubit extends Cubit<NewsStates> {
  newsCubit() : super(NewsInitState());
//----------------category--------------
  getNewsByCategory(String category) {
    emit(NewsLoadingState());
    try {
      ApiServices().getNewsByCategory(category).then((value) {
        emit(NewsSucessState(model: value!));
      });
    } catch (e) {
      print(NewsErrorState(error: e.toString()));
    }
  }

  //------------search-----------------
  getNewsBySearch(String q) {
    emit(NewsSearchLoadingState());
    try {
      ApiServices().getNewsBySearch(q).then((value) {
        emit(NewsSearchSucessState(model: value!));
      });
    } catch (e) {
      print(NewsSearchErrorState(error: e.toString()));
    }
  }

  //---------------------source------------------
  getNewsBySource(String source) {
    emit(NewsSourceLoadingState());
    try {
      ApiServices().getNewsBySource(source).then((value) {
        emit(NewsSourceSucessState(model: value!));
      });
    } catch (e) {
      print(NewsSourceErrorState(error: e.toString()));
    }
  }

  getNewsimage() {
    emit(NewsImageLoadingState());
    try {
      ApiServices().getNewsimage().then((value) {
        emit(NewsImageSucessState(model: value!));
      });
    } catch (e) {
      print(NewsImageErrorState(error: e.toString()));
    }
  }
}

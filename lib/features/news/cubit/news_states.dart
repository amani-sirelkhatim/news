import 'package:seccion6/core/news_model/news_model.dart';

class NewsStates {}

class NewsInitState extends NewsStates {}

//---------------------category------------------------------------
class NewsLoadingState extends NewsStates {}

class NewsSucessState extends NewsStates {
  final NewsModel model;

  NewsSucessState({required this.model});
}

class NewsErrorState extends NewsStates {
  final String error;

  NewsErrorState({required this.error});
}

//------------------------search-----------------------------
class NewsSearchLoadingState extends NewsStates {}

class NewsSearchSucessState extends NewsStates {
  final NewsModel model;

  NewsSearchSucessState({required this.model});
}

class NewsSearchErrorState extends NewsStates {
  final String error;

  NewsSearchErrorState({required this.error});
}

//------------------------source-----------------------------
class NewsSourceLoadingState extends NewsStates {}

class NewsSourceSucessState extends NewsStates {
  final NewsModel model;

  NewsSourceSucessState({required this.model});
}

class NewsSourceErrorState extends NewsStates {
  final String error;

  NewsSourceErrorState({required this.error});
}

//----------------------------------------------------------------------
class NewsImageLoadingState extends NewsStates {}

class NewsImageSucessState extends NewsStates {
  final NewsModel model;

  NewsImageSucessState({required this.model});
}

class NewsImageErrorState extends NewsStates {
  final String error;

  NewsImageErrorState({required this.error});
}

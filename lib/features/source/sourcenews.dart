import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:seccion6/core/functions/functions.dart';
import 'package:seccion6/core/utils/colors.dart';
import 'package:seccion6/core/utils/styles.dart';
import 'package:seccion6/features/news/cubit/news_cubit.dart';
import 'package:seccion6/features/news/cubit/news_states.dart';
import 'package:seccion6/features/newsdetails/newsdetails.dart';
import 'package:svg_flutter/svg.dart';

class sourcenews extends StatefulWidget {
  const sourcenews({super.key, required this.source, required this.name});
  final String source;
  final String name;

  @override
  State<sourcenews> createState() => _sourcenewsState();
}

class _sourcenewsState extends State<sourcenews> {
  @override
  void initState() {
    super.initState();
    context.read<newsCubit>().getNewsBySource(widget.source);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppColors.whiteColor,
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        backgroundColor: AppColors.containerBg,
      ),
      body: Expanded(
        child: BlocBuilder<newsCubit, NewsStates>(
          builder: (context, state) {
            if (state is NewsSourceLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NewsSourceSucessState) {
              var news = state.model;
              return ListView.builder(
                itemCount: news.totalResults,
                itemBuilder: (context, index) {
                  var item = news.articles![index];
                  return GestureDetector(
                    onTap: () {
                      push(context, NewsDetailsView(model: item));
                    },
                    child: Container(
                      height: 90,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.containerBg),
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: (item.urlToImage == null)
                                  ? Center(
                                      child: SizedBox(
                                          width: 130,
                                          height: 90,
                                          child: Icon(
                                            Icons.error,
                                            color: AppColors.whiteColor,
                                          )))
                                  : Image.network(
                                      item.urlToImage,
                                      width: 130,
                                      height: 90,
                                      fit: BoxFit.cover,
                                    )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  item.title ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: getBodyStyle(
                                      fontSize: 12,
                                      color: AppColors.whiteColor),
                                ),
                                Text(
                                  item.author ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: getBodyStyle(
                                      fontSize: 12,
                                      color: AppColors.lemonadaColor),
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/read.svg'),
                                    const Gap(5),
                                    Text(
                                      'Read',
                                      style: getSmallStyle(
                                          fontSize: 10,
                                          color: AppColors.whiteColor),
                                    ),
                                    const Spacer(),
                                    Text(
                                      item.publishedAt!.split('T')[0] ?? '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: getBodyStyle(
                                          fontSize: 12,
                                          color: AppColors.whiteColor),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  'error',
                  style: getSmallStyle(color: AppColors.greyColor),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

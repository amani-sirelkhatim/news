import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:seccion6/core/utils/colors.dart';
import 'package:seccion6/core/utils/styles.dart';
import 'package:seccion6/features/news/cubit/news_cubit.dart';
import 'package:seccion6/features/news/cubit/news_states.dart';
import 'package:seccion6/features/search/widgets/searchbuilder.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Your News'),
      ),
      body: BlocBuilder<newsCubit, NewsStates>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  style: getBodyStyle(color: AppColors.greyColor),
                  onChanged: (value) {
                    context.read<newsCubit>().getNewsBySearch(value);
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      hintText: 'Search for news',
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fillColor: AppColors.containerBg,
                      filled: true),
                ),
                const Gap(10),
                Expanded(child: BlocBuilder<newsCubit, NewsStates>(
                  builder: (context, state) {
                    if (state is NewsSearchSucessState) {
                      return NewsSearchListBuilder(
                        model: state.model,
                      );
                    } else if (state is NewsSearchLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off_rounded,
                              size: 50,
                              color: AppColors.lemonadaColor,
                            ),
                            Text(
                              'No Search data',
                              style:
                                  getBodyStyle(color: AppColors.lemonadaColor),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}

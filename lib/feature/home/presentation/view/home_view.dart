import 'package:cubit_baslangic/feature/home/domain/model/post_model.dart';
import 'package:cubit_baslangic/feature/home/presentation/cubit/home_cubit.dart';
import 'package:cubit_baslangic/product/core/utility/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ana Sayfa')),
      body: BlocSelector<HomeCubit, HomeState, List<PostModel>?>(
        selector: (state) => state.posts,
        builder: (context, state) {
          return ListView.separated(
            itemCount: state?.length ?? 0,
            itemBuilder: (context, index) {
              final post = state?[index];
              final String postId = post?.id?.toString() ?? '';

              if (postId.isEmpty) return const SizedBox.shrink();

              return InkWell(
                onTap: () {
                  context.push(
                    AppRouter.createPostDetailPath(postId),
                    extra: post,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (post?.title != null &&
                          post?.title!.isNotEmpty == true)
                        Text(
                          post?.title ?? '',
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      const SizedBox(height: 4),

                      if (post?.body != null && post?.body!.isNotEmpty == true)
                        Text(
                          post?.body ?? '',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildActionButton(Icons.chat_bubble_outline, '0'),
                          _buildActionButton(Icons.repeat, '0'),
                          _buildActionButton(Icons.favorite_border, '0'),
                          _buildActionButton(Icons.bar_chart, '0'),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share_outlined,
                              size: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder:
                (context, index) => const Divider(height: 1, thickness: 1),
          );
        },
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

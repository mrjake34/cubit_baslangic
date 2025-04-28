import 'package:cubit_baslangic/feature/home/domain/model/comment_model.dart';
import 'package:cubit_baslangic/feature/home/domain/model/post_model.dart';
import 'package:cubit_baslangic/feature/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailView extends StatefulWidget {
  const PostDetailView({required this.post, super.key});

  final PostModel post;
  @override
  State<PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<PostDetailView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getPostById(widget.post.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final post = widget.post;

    return Scaffold(
      appBar: AppBar(title: const Text('Gönderi')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (post.title != null && post.title!.isNotEmpty)
                        Text(
                          post.title!,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      const SizedBox(height: 8),

                      if (post.body != null && post.body!.isNotEmpty)
                        Text(post.body!, style: textTheme.bodyLarge),
                      const SizedBox(height: 16),

                      const Divider(height: 1),
                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildActionButton(
                            context,
                            Icons.chat_bubble_outline,
                            '0',
                          ),
                          _buildActionButton(context, Icons.repeat, '0'),
                          _buildActionButton(
                            context,
                            Icons.favorite_border,
                            '0',
                          ),
                          _buildActionButton(context, Icons.bar_chart, '0'),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share_outlined,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                const Divider(thickness: 6),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Yorumlar', style: textTheme.titleMedium),
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state.postDetailStatus == Status.success) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.comments?.length ?? 0,
                        itemBuilder: (context, index) {
                          final comment = state.comments?[index];
                          if (comment == null) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 24.0,
                                ),
                                child: Text(
                                  'Henüz yorum yok.',
                                  style: textTheme.bodyMedium,
                                ),
                              ),
                            );
                          }
                          return _buildCommentItem(comment);
                        },
                      );
                    }
                    return Column(
                      children: List.generate(
                        3,
                        (index) => _buildCommentPlaceholderSkeleton(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Yorumunu yaz...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // TODO: Yorum gönderme işlevi
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentItem(CommentModel comment) {
    final textTheme = Theme.of(context).textTheme;
    final name = comment.name ?? 'Anonim';
    final email = comment.email ?? 'yorumcu@mail.com';
    final body = comment.body ?? '';
    final parsedName = email.split('@').first;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                child: Text(name.isNotEmpty ? name[0].toUpperCase() : 'A'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          parsedName,
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '@${email.split('@').first}',
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(body, style: textTheme.bodyMedium),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 16, thickness: 1),
        ],
      ),
    );
  }

  Widget _buildCommentPlaceholderSkeleton() {
    return const ListTile(
      leading: CircleAvatar(backgroundColor: Colors.grey),
      title: Text('Yorum Yükleniyor...'),
      subtitle: Text('...'),
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}

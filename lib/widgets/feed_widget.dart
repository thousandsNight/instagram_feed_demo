import 'package:flutter/material.dart';

class FeedWidget extends StatelessWidget {
  final dynamic item;
  const FeedWidget({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(context),
        _buildPhotos(context),
        _buildActions(context),
        _buildContent(context),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                    'https://picsum.photos/id/${item['avatar']}/30/30'),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    item['region'],
                    style: const TextStyle(fontSize: 12, color: Colors.white54),
                  ),
                ],
              )
            ],
          ),
          const Icon(
            Icons.more_horiz,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildPhotos(BuildContext context) {
    return SizedBox(
      height: 480,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: item['photos']?.length,
            itemBuilder: (context, index) {
              return Image.network(
                'https://picsum.photos/id/${item['photos'][index]}/1080/1920',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.heart_broken_outlined,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(width: 16),
              Icon(
                Icons.message_outlined,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(width: 16),
              Icon(
                Icons.send,
                size: 30,
                color: Colors.white,
              ),
            ],
          ),
          Icon(
            Icons.bookmark,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${item['likes']} likes',
            style: const TextStyle(fontSize: 12, color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Text(
            item['content'],
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            'View all ${item['comments']} comments',
            style: const TextStyle(fontSize: 12, color: Colors.white60),
          ),
          const SizedBox(height: 8),
          Text(
            '${item['date']} days ago',
            style: const TextStyle(fontSize: 11, color: Colors.white54),
          ),
        ],
      ),
    );
  }
}

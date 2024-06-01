import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:instagram_feed_demo/widgets/feed_widget.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final dio = Dio();

  fetchData() async {
    var res = await dio
        .get('https://mock.apifox.com/m1/3785406-0-default/instagram/feed');
    return res.data;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Instagram Demo',
              style: TextStyle(color: Colors.white),
            ),
          ),
          FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> response =
                    snapshot.data as Map<String, dynamic>;
                List list = response['list'] ?? [];
                return SliverList.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    var item = list[index];
                    return FeedWidget(item: item);
                  },
                );
              }
              return SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

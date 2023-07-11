import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:http/http.dart';
import 'package:tripler/src/core/errors/failure.dart';
import 'package:tripler/src/modules/fetch/domain/models/model_user.dart';
import 'package:tripler/src/modules/fetch/presentation/page/store/fetch_users_store.dart';

import '../../domain/uses_cases/fetch_use_case.dart';
import '../../external/data/github_datasouce.dart';
import '../../infra/fetch_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FetchUseCase fetch;
  late FetchStore store;

  @override
  void initState() {
    fetch = FetchUseCase(
        fetchRepository: FetchRepository(FetchUsersGitHub(Client())));
    store = FetchStore(fetchUseCase: fetch);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Users",
              ),
              keyboardType: TextInputType.text,
              onChanged: (text) {
                if (text.isNotEmpty) {
                  store.onSearch(text);
                }
              },
            ),
          ),
          ScopedBuilder(
              store: store,
              onError: (context, error) => Center(child: Text(error.message)),
              onLoading: (context) =>
                  const Center(child: CircularProgressIndicator()),
              onState: (context, state) => Expanded(
                  child: ListView.builder(
                      itemCount: store.state.length,
                      itemBuilder: (context, index) {
                        final item = store.state[index];
                        return ListTile(
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(item.avatar_url)),
                          title: Text(item.name),
                          subtitle: Text(item.location ?? ""),
                        );
                      }))),
        ],
      ),
    );
  }
}

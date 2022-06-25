import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/src/core/route/routes.dart';
import 'package:my_app/src/features/home/presentation/state/home_view_model.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(placeListFilter);
    final textController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.logIn,
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Buscar...',
                suffix: IconButton(
                  onPressed: () {
                    textController.clear();
                    ref.read(searchText.notifier).state = '';
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              onSubmitted: (value) {
                ref.read(searchText.notifier).state = value;
              },
            ),
          ),
          Expanded(
            child: data.when(
              data: (data) {
                if (data.isEmpty) {
                  return Center(
                    child: Text(
                      'No hay datos',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  );
                }

                return ListView.separated(
                  itemCount: data.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, pos) {
                    final item = data[pos];
                    return ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(.5),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.network(
                          item.icon,
                          height: 30,
                          width: 30,
                        ),
                      ),
                      title: Text(item.name),
                      subtitle: Text('Rating: ${item.rating}'),
                    );
                  },
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (e, _) => Center(
                child: Text(
                  e.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

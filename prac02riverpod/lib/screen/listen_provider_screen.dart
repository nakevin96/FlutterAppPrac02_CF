import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac02riverpod/layout/default_layout.dart';
import 'package:prac02riverpod/riverpod/listen_provider.dart';

// StateFul widget은 아래와 같이 ConsumerStatefulWidget으로 변경하면 됩니다.
// 그냥 'Consumer'만 붙여주면 됩니다 😁
class ListenProviderSreen extends ConsumerStatefulWidget {
  const ListenProviderSreen({super.key});

  @override
  ConsumerState<ListenProviderSreen> createState() =>
      _ListenProviderSreenState();
}

// Stateful에서 Consumer를 사용할 경우 build에서 WidgetRef ref를 받지 않아도 됩니다.
// context가 this.context로 제공되는 것과 같이 ref역시
// ref를 ConsumerState가 제공해줍니다.
class _ListenProviderSreenState extends ConsumerState<ListenProviderSreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listenProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(listenProvider, (previous, next) {
      //previous는 기존 상태 next는 다음 상태
      if (previous != next) {
        controller.animateTo(next);
      }
    });
    return DefaultLayout(
      title: 'ListenProviderSreen',
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: List.generate(
          10,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(index.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      ref.read(listenProvider.notifier).update((state) {
                        if (state > 0) {
                          return state - 1;
                        }
                        return state;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ref.read(listenProvider.notifier).update((state) {
                        if (state < 9) {
                          return state + 1;
                        }
                        return state;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

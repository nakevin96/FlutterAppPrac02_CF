import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac02riverpod/layout/default_layout.dart';
import 'package:prac02riverpod/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStringStateProvider);
    final state2 = ref.watch(gIntStateProvider);
    final state3 = ref.watch(gIntFutureStateProvider);
    final state4 = ref.watch(gIntFutureState2Provider);
    final state5 = ref.watch(gFamilyStateMultiflyProvider(
      number1: 4,
      number2: 4,
    ));
    // Consumer 위젯 안으로 옮김
    // final state6 = ref.watch(gStateNotifierProvider);

    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state1),
            Text(state2.toString()),
            state3.when(
              data: (data) => Text(data.toString()),
              error: (err, stack) => Text(err.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
            state4.when(
              data: (data) => Text(data.toString()),
              error: (err, stack) => Text(err.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
            Text(state5.toString()),
            // state6는 +, - 를 눌렀을 때 변화합니다.
            // +, -, invalidate하면 state6만 변하는데
            // 문제는 이 state와 상관 없는 나머지 위젯들도 전부 다시 build됩니다.
            // state 1~6 중 하나만 실행되도 전체 위젯이 빌드가 되는 것입니다.
            // 이를 방지하기 위해 별도 위젯으로 분리할 수 있지만 riverpod에서는 이를 비효율적이라 생각했고
            // Consumer 위젯을 별도로 제공해주어 이 기능을 수행할 수 있게 해줍니다.
            // Text(state6.toString()),
            Consumer(
              builder: (context, ref, child) {
                // Consumer의 세번째 파라미터인 chlid는 아래와 같이 쓸 수 있습니다.
                // 이 기능이 필요한 이유는 Consumer로 만들어낸 부분도 state가 변하는 부분을 제외한
                // 나머지 부분들은 build될 필요가 없기 때문에
                // build에 자원이 많이 소요되거나 state 업데이트 마다 build하고 싶지 않은 위젯을 여기에 넣어줍니다.
                final state6 = ref.watch(gStateNotifierProvider);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('State6: $state6'),
                    const SizedBox(
                      width: 16.0,
                    ),
                    if (child != null) child,
                  ],
                );
              },
              child: const Text('Hello I am Cousumer Child'),
            ),
            IconButton(
              onPressed: () {
                ref.read(gStateNotifierProvider.notifier).increment();
              },
              icon: const Icon(
                Icons.add,
              ),
            ),
            IconButton(
              onPressed: () {
                ref.read(gStateNotifierProvider.notifier).decrement();
              },
              icon: const Icon(
                Icons.remove,
              ),
            ),
            // invalidate() 유효하지 않게 만들기
            //invalidate를 호출 하면 provider가 disposed되고 다시 udpate되어 초기상태로 돌아감
            ElevatedButton(
              onPressed: () {
                ref.invalidate(gStateNotifierProvider);
              },
              child: const Text('Invalidate'),
            )
          ],
        ),
      ),
    );
  }
}

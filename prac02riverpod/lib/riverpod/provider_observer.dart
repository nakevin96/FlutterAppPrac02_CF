import 'package:flutter_riverpod/flutter_riverpod.dart';

// ProviderScope에서 observers에 넣어주기 위해서는 ProviderObserver를 상속한 클래스를 만들어야 합니다.
class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    // didUpdateProvider는 provider가 업데이트 될 때 호출됩니다.
    // provider는 어떤 provider가 업데이트 되었는지
    // prevValue와 NewValue는 이전, 현재 값
    // container는 flutter를 쓸 때 신경쓸 필요 없습니다.
    super.didUpdateProvider(provider, previousValue, newValue, container);
    print(
        "[Provider Updated] provider: $provider / pv: $previousValue / cv: $newValue");
  }

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    // didAddProvider는 프로바이더가 추가될 때 호출됩니다.
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    // didDisposeProvider는 provider가 제거될 때 호출됩니다.
    super.didDisposeProvider(provider, container);
  }
}

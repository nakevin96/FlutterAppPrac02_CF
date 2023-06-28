import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// code generation이 추가 된 이유
// 1) 어떤 provider를 사용할 지 고민하지 않게 도와주기 위함
// 2) Parameter(family)에 여러 값을 전달하기 위해서는 별도의 클래스를 만들어서 넣어줘야 했음
// 이런 귀찮은 과정을 code generation이 대신 해줌
// 즉 Family 파라미터를 일반 함수처럼 사용할 수 있게 해줌

// 1)
final _testProvider = Provider<String>((ref) => 'Hello code generation');

// 위 _testProvider를 code generation을 통해 생성해 봅시다.
// 규칙은 다음과 같습니다.
// 원하는 상태값을 반환하는 함수를 정의합니다.
// 함수 이름이 무엇이 되었건 그 함수이름의 제일 앞을 대문자로 바꾼 것을 타입처럼 적어두고 ref를 넣어줍니다.
// 함수 상단에 riverpod annotation을 달아줍니다.
// flutter pub run build_runner build를 통해 코드 제네레이션을 진행합니다.
@riverpod
String gStringState(GStringStateRef ref) {
  return 'Hello code generation';
}
// 이제 gStateProvider를 가져다 쓰면 됩니다.

@riverpod
int gIntState(GIntStateRef ref) {
  return 0;
}

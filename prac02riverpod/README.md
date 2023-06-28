# prac02riverpod

## Intro

---

RiverPod을 공부하기 위한 프로젝트 입니다.
글로벌 상태관리를 시작해봅시다.

'상태'는 데이터를 말합니다.  
`statefulWidget`을 쓰는 것도 상태 관리의 일종이라 할 수 있죠.

`setState`만 사용을 하게 되면  
**스크린과 스크린 사이에서 데이터를 넘겨줄 때** 문제가 있을 수 있습니다.

설치는 pub.dev에서 flutter riverpod을 검색 한 후 설치하시면 됩니다 [이동](https://pub.dev/packages/flutter_riverpod/install)

<br/>
<br/>

## Provider의 종류

---

데이터를 관리하고 그 안에서 어떻게 변화시킬 것인가  
하는 동일한 기능을 제공합니다.  
다만 '어떤' 데이터를 다룰 때, '얼마나 복잡'한 데이터를 다룰 때  
사용할 것인가에 차이가 존재합니다.  
모든 Provider는 **글로벌 하게 선언된다** 라는 특징을 갖습니다.

### ■ Provider

기본 provider로 베이스가 됩니다.  
아무 타입이나 반환이 가능하며  
Service, 계산 값들을 반환할 때 주로 사용됩니다.  
또한 여러 Provier 값들을 묶어 한번에 반환 값을 만들 수 있습니다.  
(_Provider 안에 다른 Provider를 넣는게 가능합니다_)

### ■ StateProvider

UI에서 "**직접적으로**" 데이터를 변경할 수 있게 하고 싶을 때 사용됩니다.  
단순한 형태의 데이터(int, double, String..)만 관리하며  
Class, Map, List등  
<u>복잡한 형태의 데이터와 복잡한 로직/u>은 다루지 않습니다.</u>

### ■ StateNotifierProvider

`StateProvider`와 "**직접적으로**" 데이터를 변경하고자 할 때 사용한다는 것은 유사합니다.

하지만 `StateNotifierProvider`의 경우 **복잡한 데이터**도 관리를 할 수 있습니다.

### ■ FutureProvider

Future 타입만 반환이 가능합니다.  
API 요청의 결과를 반환할 때 자주 사용합니다.  
단점은 복잡한 로직 또는 사용자의 특정 행동 뒤에
Future를 재실행 하는 기능이 없다는 것 입니다.

### ■ StreamProvider

`FutureProvider`와 유사한 provider로 주로 socket과 같은 것을 사용하여  
API 요청 결과를 Stream으로 반환할 때 주로 사용합니다.

### ■ ChangeNotifierProvider

사용을 안하고 Provider에서 Riverpod으로 마이그레이션 하는 용도입니다.

---

## `ref.read` vs `ref.watch`

`ref.watch`는 반환값의 업데이트가 있을 때 지속적으로 build를 재실행합니다.  
이로인해 <u>필수적으로 UI관련 코드에만 사용됩니다.</u>

`ref.read`는 실행되는 순간 **단 한번만** provider 값을 가져옵니다.  
`onPressed`의 콜백처럼 <u>특정 액션 뒤에 실행되는 함수 내부에서 주로 사용</u>됩니다.

---

## Listen 함수

어떤 event내에서 한 번만 실행되기를 원할 때는 `ref.read`를 쓰고,  
Screen 내에서 지속적으로 state를 관찰하다가 state에 변화가 발생했을 때
업데이트 해주기 위해 `ref.watch`를 사용했습니다.

그럼 `ref.listen`은 언제 쓸까요?

**listen** 이라는 것은 일반적으로  
무언가 값이 변경이 되고, 변경된 값을 활용하여 특정 함수를 동작시키고 싶을 때 사용합니다.

provider에서도 이런 것이 가능합니다.  
상세 내용은 Listen관련 commit을 확인해주세요

++ riverpod에서 제공해주는 `ref.listen`의 경우  
dispose를 따로 해줄 필요가 없습니다.  
build함수 내에서 사용을 해도 중복되어 실행되지 않게 내부적으로 설계되어있기 때문에 자유롭게 사용하면 됩니다.

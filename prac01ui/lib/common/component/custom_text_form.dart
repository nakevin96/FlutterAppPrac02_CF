import 'package:flutter/material.dart';
import 'package:prac01ui/common/const/colors.dart';

class CustomTextForm extends StatelessWidget {
  final String? customHintText;
  final String? customErrorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;

  const CustomTextForm({
    super.key,
    required this.onChanged,
    this.customHintText,
    this.customErrorText,
    this.obscureText = false,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    const baseBorder = OutlineInputBorder(
      // borderSide는 실제 테두리를 의미합니다. 여기서 색상과 너비를 지정할 수 있습니다.
      borderSide: BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1.0,
      ),
    );

    return TextFormField(
      //TextForm의 값이 변화했을 때 실행할 함수
      onChanged: onChanged,

      // TextFormField에 포커싱이 올라왔을 때 커서 색상 변경 : cursorColor
      cursorColor: PRIMARY_COLOR,

      // obscureText는 비밀번호 입력할 때만 사용합니다. true로 설정하면 *로 대체됩니다.
      obscureText: obscureText,

      // autofocus를 true로 설정하면 화면에 해당 formfield가 들어오게 될 경우 focusing됩니다.
      // 동시에 여러개 요소에 autofocus가 걸려있다면 가장 상단 요소에 focusing이 됩니다.
      autofocus: autofocus,

      // decoration에 InputDecoration을 넣으면 필드에 디자인을 할 수 있습니다.
      // contentPadding을 하면 내용물에 padding이 적용됩니다.
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),

        // hintText는 React의 placeholder와 같이 실제 글을 쓰기 전 나오는 text입니다.
        hintText: customHintText ?? '이세계아이돌 LockDown 최고!',

        // hintStyle은 hintText에 스타일링을 할 수 있습니다.
        hintStyle: const TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 14.0,
        ),

        // errorText를 추가하면 border가 red로 나오고 error text에 넘긴 값이 textform아래에 표기됩니다.
        errorText: customErrorText,

        // textform field에 배경색을 넣고 싶다면 filled를 true로 바꿔주어야 합니다.
        filled: true,
        fillColor: INPUT_BG_COLOR,

        // border는 모든 input상태의 기본 스타일 세팅입니다.
        // 모든 상태라는 건 focus전, focus 후, disabled와 같은 모든 상태를 의미합니다.
        border: baseBorder,

        enabledBorder: baseBorder,

        // 포커싱이 들어갔을 때 스타일링을 할 때는 focused border를 사용하면 됩니다.
        // baseBorder값을 유지한 채로 특정 값만 바꿔 사용하기 위해서는 copywith을 사용하면 됩니다.
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}

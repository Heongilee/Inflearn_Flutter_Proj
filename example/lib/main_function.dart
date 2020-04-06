import 'package:flutter/material.dart';

void main(List<String> args) {
  do_Something(name: '이헌기', age: 30);  //default variable override
  do_Something(name: '홍길동', age: 1, job: 'Talent');

  // 타입 비교하기
  var a = 10;

  var b = 3.5;

  // int c = b as int;

  if(a is int){
    print('정수');
  }

  if(a is! double){
    print('정수가 아니다');
  }

  String name;

  print(name?.toLowerCase()); //name이 null값이면 '?.' 이후의 메소드를 참조할 수 있도록 해주는 역할.
}

// 메소드의 파라미터를 중괄호{} 로 묶으면 옵션 처리를 할 수 있다.(즉, 꼭 인자로 넣을 필요가 없어진다.)
// Optional Parameter에서 Default variable을 주고 싶을때 아래와 같이 씁니다.
void do_Something({String name, @required int age, String job}){
  if(name != null) print(name);
  if(age != null) print(age);
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}



class _MainPageState extends State<MainPage> {
  void something2() {

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // onPressed 안에 들어간 메소드 호출 방식을 익명 함수라고 한다.
      // 만들어 둔 함수를 쓰고 싶다면 소괄호 빼고 함수 이름만 적는다.
      child: RaisedButton(onPressed: something2,
      ),
    );
  }
}
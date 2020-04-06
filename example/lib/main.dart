
void main(){
  print('Hello World');
  var a = 10;
  var str = 'Hello';
  var b = 3.5;
  var isMarried = true;

  // dynamic은 var라는 일반적인 변수들과 다르다.
  // 함수의 파라미터(혹은 인자) 로 쓰일 경우 모든 타입을 받을 수 있게 된다.
  dynamic c = 10;
  myPrint(10);

  num d = 20;
  num e = 44.5;
  // num 타입은 정수형과 실수형 모두 받을 수 있는 자료형.
  // 자바와는 다르게 더 큰 타입으로 auto-casting을 지원하지 않기 때문에
  // 명시적으로 타입캐스팅(as [_타입명_])을 하거나, 
  int Integer_number = 8;

  // 아니면 num타입을 사용할 수 밖에 없다. 
  num Numtype_number_1 = Integer_number;

  // final 은 자바와 똑같은 기능을 하나, 타입 명을 (써도 되지만) 쓸 필요는 없다. (자동 형 추론...)
  final final_integer = 10;
  final final_double = 10.9;


  // final vs const
  // 공통점 : 둘 다 변경을 못 함.
  // final : 동적으로 메모리 할당. (재사용이 빈번한 경우 이외에 애매할 경우 사용.)
  // const : compile-time에 메모리 할당. (재사용이 빈번한 경우(예를 들어, 패딩을 준다던지...) 사용함.)

  // List

  List<String> List_fruits = ['apple', 'banana', 'orange', 'grape', 'water-melon', ];
  var var_fruits = ['melon', 'straw-berry', 'mango'];
  
  // List :: 리스트 전체 출력
  print(List_fruits);
  print(var_fruits);

  // List :: 인덱싱
  print(List_fruits[0]);
  print(var_fruits[0]);


  // Set
  Set<String> Set_Stringtype_friuts ={'apple', 'banana', 'orange', 'grape', 'water-melon', };
  print(Set_Stringtype_friuts);

  // Map (JSON type {K, V})
  var item_Map = {
    'Key_1' : 1,
    'Key_2' : 11,
    'Key_3' : 111,
    'Key_4' : 1111,
    'Key_5' : 11111,
  };

  print(item_Map);

  // Spread operator :: 두 리스트 끼리 병합(merge)한다거나 할 때 사용할 수 있는 연산자.
  var items_front = [1, 2, 3];
  var items_back = [...items_front, 4, 5];  //You should update SDK version up to 2.3.0.
  
  print(items_back);
}

void myPrint(dynamic str){
  print(str);

  return;
}
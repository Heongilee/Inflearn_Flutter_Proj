# Inflearn_Flutter_Proj

since 2020-03-08

* IDE : vscode && Android Studio
* Language : Dart
* Framework : Flutter
* Server \ DB \ Google Authentication : Firebase(URL : https://console.firebase.google.com/project/instagram-clone-e3875/overview)

Q>
  구글 파이어베이스 적용하는 방법...
  
A<
  1. console.firebase.google.com 접속
  2. 프로젝트 생성
  3. 명령 프롬프트 창에서 'keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore' 입력
  4. Enter your password : (Enter)
  5. SHA-1 코드를 복사해서 인증키에 붙여넣기.
  6. dependencies 및 필요한 명령어 라인 추가
  
  (만약, 에러가 뜬다면, .\android\app\build.gralde 에서 defaultConfig {...} 아래에 다음 줄 추가.)
<pre>
<code>
  multiDexEnabled true
</code>
</pre>

  (그리고, .\android\gradle.properties 아래에 다음 두 줄 추가.)
<pre>
<code>
  android.useAndroidX=true
  android.enableJetifier=true
</code>
</pre>
  
  7. '수고하셨습니다. 앱에 Firebase를 추가했습니다.'가 뜨면 성공! \
  (※ 마지막으로, google-services.json 파일은 .\android\app 밑에 넣는거다 src가 아니라)

Goal : making a Instagram clone app...


#### WireFrame
![Wire_Frame_01](https://github.com/Heongilee/Inflearn_Flutter_Proj/blob/master/New%20Wireframe%201.png?raw=true)
![Wire_Frame_02](https://github.com/Heongilee/Inflearn_Flutter_Proj/blob/master/CreatePage.png?raw=true)

# toonflix


## Future 를 기다리는 방법 #1
1. **앱 시작 및 초기 화면 빌드**
   - `initState()`에서 `waitForWebToons()`가 호출된다.
   - `waitForWebToons()` 함수에서 `await`로 `ApiService.getTodaysToons()`의 결과를 기다리지만, 비동기 작업이 끝나기 전까지 `webtoons`는 빈 리스트 `[]`이고, `isLoading`은 `true` 상태다.
   - 이 상태에서 첫 번째 `build()`가 실행되며, 유저에게 빈 화면 혹은 배경색만 있는 화면이 보여진다.

2. **비동기 작업 실행 중**
   - `ApiService.getTodaysToons()`에서 데이터를 가져오는 동안, 화면은 그대로 빈 상태거나 기본 UI만 표시된다. 데이터는 아직 로드되지 않은 상태다.
   - 네트워크 상태가 느리거나 응답이 느리면 이 빈 화면이 조금 더 오래 지속될 수 있다.

3. **데이터 로딩 완료 후 상태 업데이트**
   - `ApiService.getTodaysToons()`에서 데이터가 로드되면, `webtoons` 리스트에 데이터가 할당되고, `isLoading`은 `false`로 변경된다.
   - 이후 `setState()`가 호출되면서 상태가 업데이트되고, 화면이 다시 빌드된다.

4. **다시 화면 빌드 및 데이터 표시**
   - 두 번째 `build()`가 실행되며, 이제는 `webtoons` 리스트에 데이터가 있고, `isLoading`이 `false` 상태이므로 유저는 데이터를 볼 수 있게 된다.

5. **최종 화면**
   - 유저는 로드된 데이터를 기반으로 한 최종 화면을 확인할 수 있다.

6. **로딩 인디케이터 추가 (선택 사항)**
    - 유저 경험을 개선하기 위해, 데이터가 로드되는 동안 로딩 인디케이터를 표시할 수 있다. `isLoading` 상태에 따라 로딩 스피너를 보여주는 방법을 사용하면, 빈 화면 대신 로딩 중임을 유저에게 시각적으로 알릴 수 있다.

## ListView 와 ListView.builder 차이
1. **아이템 생성**
   - ListView는 리스트에 있는 아이템을 한 번에 렌더링 한다.
   - ListView.builder는 화면에 보이는 아이템만 렌더링하고, 사용자가 스크롤 할 경우 필요한 아이템을 생성한다.

2. **리스트 크기**
   - ListView는 아이템 수가 적고, 리스트가 고정된 경우에 적합하다.
   - ListView.builder는 많은 아이템을 가진 대규모 리스트에 적합하다.


## NetworkImageLoadException 오류
1. **[문제 해결 과정 기록](https://velog.io/@novellus/NetworkImageLoadException-%EC%98%A4%EB%A5%98-%ED%95%B4%EA%B2%B0)**
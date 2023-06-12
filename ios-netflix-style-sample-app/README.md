# ios-netflix-style-sample-app
넷플릭스 스타일의 영화 추천 iOS Application

## 구현
- 서로다른 크기와 형태를 가지는 셀의 목록
- 세로 방향 : 각 컨셉별로 구성
- 가로 방향 : 각각의 컨셉에 속한 콘텐츠들로 구성

<img width="20%" src="https://user-images.githubusercontent.com/39071796/143871133-ff82f106-e9aa-4c5d-a6dd-c1b260a3ff6f.gif"/>

## 활용기술
- ```UICollectionView```
     
     - 여러 데이터를 관리하고 커스텀 가능한 레이아웃을 사용해서 사용자에게 보여줄 수 있는 객체
    
- ```Compositional Layout```
    - 복잡한 결과를 단순한 것으로 구성하기   
    - 이것만으로 모든 레이아웃을 작성 가능하게하기   
    - 프레임워크에서 자체 성능 최적화 수행    
    
- ```SnapKit```
    - 코드베이스로 UI를 구현하고 Auto Layout을 고려해야할때 직관적이고, 간편하게 작성할수 있게 도와주는 오픈소스 프레임워크

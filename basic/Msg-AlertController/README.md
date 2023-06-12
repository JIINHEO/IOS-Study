# 메시지 알림창 - UIAlertController
> 메시지 창은 앱 실행 도중에 사용자에게 메시지를 전달하고 의사를 입력받기 위한 목적으로 제공되는 객체입니다.   
> 알림창과 액션 시트창의 결정적인 차이는 모달 여부입니다.   
> 모달이란 창이 닫힐 때까지 그  창을 제외한 화면의 다른 부분은 반응할 수 없도록 잠기는 것을 말합니다.   
* 알림창은 텍스트 필드 추가가 가능하며 허용/비허용과 같은 사용자의 선택을 입력받는 용도라면   
* 액션 시트는 여러 개의 항목 중에서 사용자가 고를 수 있도록 할 때 사용되는 경향이 많습니다.


<img width="800" alt="image" src="https://user-images.githubusercontent.com/39071796/128007738-608bfbd7-29d2-4a03-a1c2-d446b7f41ce4.png">

* **.cancel**  메시지 창 내에서는 한 번만 사용할 수 있습니다. 
* **.destructive**  주로 중요한 내용을 변경 하거나 삭제해서 되돌릴 수 없는 결정을 하는 버튼에 적용됩니다.




<img width="30%" src="https://user-images.githubusercontent.com/39071796/128006819-ddba6f20-794c-4934-9fae-4dbbdab17337.gif"/>

```
        // 메시지창 객체 생성
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .alert)
   
        let cancel = UIAlertAction(title: "취소", style: .cancel) { (_) in self.result.text = "취소 버튼을 클릭했습니다."}
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in self.result.text = "확인 버튼을 클릭했습니다."}
        
        // 버튼을 컨트롤러에 등록
        alert.addAction(cancel)
        alert.addAction(ok)
        
        // 메시지 창 실행
        self.present(alert, animated: false)
```


## 화면이 뜨자마자 자동으로 메시지 창을 띄워주어야 할 때
```
    override func viewDidLoad() {
        //메시지 창을 처리하기 부적절한 위치(아직 뷰가 화면에 구현되기 전)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 메시지 창을 처리하기 적절한 위치 - 뷰가 완전히 화면에 표현되고 난 다음에 호출됨
        // 간혹 화면이 뜨자마자 자동으로 메시지 창을 띄워주어야 할 때
        // 네트워크 기반 서비스에서 네트워크가 연결되지 않았을 때가 대표적인 경우
        //let alert = UIAlertController(..............
    }
```

## 입력 필드를 가지는 메시시 창
```
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "암호" // 안내 메시지
            tf.isSecureTextEntry = true // 비밀번호 처리
        })
```

# 델리게이트 
## 텍스트 필드
> 델리게이트 패턴을 사용하는 대표적인 객체 중의 하나입니다.

1. 텍스트 필드에 대한 델리게이트 프로토콜을 구현한다.
2. 텍스트 필드의 델리게이트 속성을 뷰 컨트롤러에 연결한다. 

* 델리게이트 프로토콜 구현 : 클래스명 + Delegate

<img width="30%" src="https://user-images.githubusercontent.com/39071796/128595929-3e5bd08e-4c1c-43e1-965e-a2a9f96e40ad.gif">

## 최초 응답자(First Responder)
* UIWindow 객체는 사용자 인터페이스 구조에서 사용자에 가장 가까이 위치한 객체로, 사용자로부터 발생하는 터치 관련 이벤트를 재부 객체로 전달하는 역할을 담당합니다.
* 이를 위해 UIWindow는 이벤트가 발생했을 때 우선적으로 응답할 객체를 가리키는 ```최초 응답자(First Responder)```라는 포인터를 가지고 있습니다.
* 포커스(Focus)와 비슷한 개념이라고 생각하면 됩니다.
* 특정 객체를 최초 응답자로 만들고 싶다면 그 객체에 대한 becomeFirstResponder() 메소드를 호출하면 됩니다. 

### 각각의 델리게이트 메소드는 실행 시점에 맞추어 호출됩니다.  
<img width="523" alt="image" src="https://user-images.githubusercontent.com/39071796/128584308-470991a4-d19e-490f-a3ad-0ff21bab2bd4.png">
<img width="523" alt="image" src="https://user-images.githubusercontent.com/39071796/128584326-f6e5a71a-c159-4f31-94ac-8aa103d09523.png">

## textField(_:shouldChangeCharactersIn:replacementString:)
* 텍스트 필드에 값이 입력되었을 떄 호출되며, 이때 편집되는 문자열도 함께 전달됩니다.   
* 이 메소드의 반환값에 따라 편집 내용이 텍스트 필드에 반영되기도, 반영되지 않기도 하기 때문에 이를 응용하면 특정 문자열을 입력, 차단, 제어 할수 있습니다.
```
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("텍스트 필드의 내용이 \(string)으로 변경됩니다.")
        if Int(string) == nil { // 입력된 값이 숫자가 아니라면 true를 리턴
            // 현재 텍스트 필드에 입력된 길이와 더해질 문자열 길이의 합이 10을 넘는다면 반영하지 않음
            if(textField.text?.count)! + string.count > 10 {
                return false
            } else {
                return true
            }
        } else { // 입력된 값이 숫자라면 false를 리턴
            return false
        }
    }
```

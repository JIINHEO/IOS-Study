//
//  TodoListView.swift
//  VoiceMemo
//
//  Created by jiinheo on 2/18/24.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject private var pathModel: PathModel
    
    // stateObject, ObservableObject로 할 수도 있다.
    @EnvironmentObject private var todoListViewModel: TodoListViewModel
    
    
    var body: some View {
        ZStack {
            // 투두 셀 리스트
            VStack {
                if !todoListViewModel.todos.isEmpty {
                    CustomNavigationBar(
                    isDisplayLeftBtn: false,
                    rightBtnAction: todoListViewModel.navigationRightBtnTapped,
                    rightBtnType: todoListViewModel.navigationBarRightBtnMode
                    )
                } else {
                    Spacer()
                        .frame(height: 30)
                }
                TitleView()
            }
        }
    }
    
//    var titleViwe: some View {
//        Text("TItle")
//    }
//    
//    func titleView() -> some View {
//        Text("Title")
//    }
    
    /*
     var나 func로 만들어도 되고,
     struct로 빼도 된다.
     스타일의 차이기도하고 struct로 하면 다른 뷰에서도 사용하기 좋고,
     var나 func로 하면 @EnvironmentObject 이런거 안 해줘도 된다.
     */
}

// MARK: = TodoList 타이틀 뷰
private struct TitleView: View {
    @EnvironmentObject private var todoListViewModel: TodoListViewModel
    
    fileprivate var body: some View {
        HStack {
            if todoListViewModel.todos.isEmpty {
                Text("To do list를 \n추가해 보세요.")
            } else {
                Text("To do list \(todoListViewModel.todos.count)개가 \n있습니다.")
            }
            Spacer()
        }
        .font(.system(size:30, weight: .bold))
        .padding(.leading, 20)
    }
}



#Preview {
    TodoListView()
        .environmentObject(PathModel())
        .environmentObject(TodoListViewModel())
}

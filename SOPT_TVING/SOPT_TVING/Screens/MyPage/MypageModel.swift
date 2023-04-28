//
//  MypageModel.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/28.
//

import Foundation


struct InfoFirstModel: Hashable {
    var title: String
}
extension InfoFirstModel {
    static let items: [InfoFirstModel] = [InfoFirstModel(title: "이용권"),
                                          InfoFirstModel(title: "1:1문의내역"),
                                          InfoFirstModel(title: "예약알림"),
                                          InfoFirstModel(title: "회원정보 수정"),
                                          InfoFirstModel(title: "프로모션 정보 수신 동의")
    ]
}

struct InfoSecondModel: Hashable {
    var title: String
}
extension InfoSecondModel {
    static let items: [InfoSecondModel] = [InfoSecondModel(title: "공지사항"),
                                          InfoSecondModel(title: "이벤트"),
                                          InfoSecondModel(title: "고객센터"),
                                          InfoSecondModel(title: "티빙 알아보기")
    ]
}


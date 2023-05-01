//
//  MypageModel.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/28.
//

import UIKit

struct ProfileModel: Hashable {
    var image: UIImage
    var name: String
}
extension ProfileModel {
    static let item: [ProfileModel] = [ProfileModel(image: .profile, name: "Doosan")]
}
struct InfoFirstModel: Hashable {
    var image: UIImage
    var title: String
    var subTitle: String
}
extension InfoFirstModel {
    static let items: [InfoFirstModel] = [InfoFirstModel(image: .icVideo, title: "이용권", subTitle: "사용중인 이용권이 없습니다."),
                                          InfoFirstModel(image: .icCopyRight, title: "1:1문의내역", subTitle: "0")
                                          
    ]
}

struct InfoSecondModel: Hashable {
    var title: String
}
extension InfoSecondModel {
    static let items: [InfoSecondModel] = [InfoSecondModel(title: "이용권"),
                                          InfoSecondModel(title: "1:1문의내역"),
                                          InfoSecondModel(title: "예약알림"),
                                          InfoSecondModel(title: "회원정보 수정"),
                                          InfoSecondModel(title: "프로모션 정보 수신 동의")
    ]
}

struct InfoThirdModel: Hashable {
    var title: String
}
extension InfoThirdModel {
    static let items: [InfoThirdModel] = [InfoThirdModel(title: "공지사항"),
                                          InfoThirdModel(title: "이벤트"),
                                          InfoThirdModel(title: "고객센터"),
                                          InfoThirdModel(title: "티빙 알아보기")
    ]
}

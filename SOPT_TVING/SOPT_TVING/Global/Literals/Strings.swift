//
//  Strings.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/21.
//

import Foundation

struct I18N {
    struct Login {
        static let title = "TVING ID 로그인"
        static let findAccountLabel = "아직 계정이 없으신가요?"
        static let findAccount = ["아이디 찾기", "비밀번호 찾기", "닉네임 만들러가기"]
        static let login = "로그인하기"
        static let idTextField = "아이디"
        static let passwordTextFiedl = "비밀번호"
        static let goMain = "메인으로"
    }
    
    struct MyPage {
        struct FirstSection {
            static let beforeImage = "이용권을 구매하고 "
            static let afterImage = "등 인기 TV프로그램과 다양한 영화 콘텐츠를 자유롭게 시청하세요!"
        }
        struct Logout {
            static let title = "로그아웃"
        }
        struct Profile {
            static let title = "프로필 전환"
        }
    }
}

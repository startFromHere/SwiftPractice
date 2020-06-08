//
//  Array+Only.swift
//  Memorize
//
//  Created by 刘涛 on 2020/6/7.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

extension Array {
    var only:Element? {
        count == 1 ? first : nil
    }
}

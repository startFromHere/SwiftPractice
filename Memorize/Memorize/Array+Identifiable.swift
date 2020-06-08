//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by 刘涛 on 2020/6/7.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(maching item: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == item.id {
                return index
            }
         }
        return nil
    }
}

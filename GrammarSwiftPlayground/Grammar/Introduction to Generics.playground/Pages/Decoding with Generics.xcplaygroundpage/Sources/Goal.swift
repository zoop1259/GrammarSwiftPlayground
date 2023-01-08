//
//  Goal.swift
//  MyGoals
//
//  Created by Stewart Lynch on 2021-02-14.
//
import Foundation

//플레이그라운드에서 public을 사용해야되는 이유는 각 폴더가 별도의 모듈로 간주되기 떄문이다.
//즉 플레이그라운드가 아닌 프로젝트에선 public을 사용하지 않아도 된다.
public struct Goal: Codable {
   public var id = UUID().uuidString
   public var name: String
   public var date: Date
   public var completed: Bool = false
}





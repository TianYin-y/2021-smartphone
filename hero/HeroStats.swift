//
//  HeroStats.swift
//  hero
//
//  Created by Tian Yin on 04/16/21.
//

import Foundation



struct HeroStats:Decodable{
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
    let pro_win: Int
    let base_attack_max: Int
    let base_str: Int
    let base_agi: Int
    let base_int: Int
    let base_health: Int
    let base_mana: Int
    let move_speed: Int
    let base_mr: Int
    let pro_pick: Int
}

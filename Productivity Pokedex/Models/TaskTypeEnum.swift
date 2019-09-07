//
//  TaskTypeEnum.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 5/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//
// Describes if the task has associated measure

enum TaskType: String {
    case Timed      //value of associated task refers to time in minutes
    case Count      //  '' refers to total count, i.e. 50 pushups
}

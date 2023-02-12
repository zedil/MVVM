//
//  HabitsAPI.swift
//  habitAppMVVM
//
//  Created by Dilara Şimşek on 11.02.2023.
//

import Foundation

class HabitsAPI {
    static func getHabits() -> [Habit] {
        let habits = [
            Habit(habitName: "Green tea cup", habitImage: "tea", habitClock: "7:40 PM - 7:50 PM", isTimerOpen: true),
            Habit(habitName: "Video Gaming", habitImage: "games", habitClock: "8:00 PM - 8:30 PM", isTimerOpen: false),
            Habit(habitName: "Diary Writing", habitImage: "write", habitClock: "9:00 PM - 10:00 PM", isTimerOpen: true)
        ]
        return habits
    }
}

//
//  InfoModel.swift
//

import Foundation

struct InfoModel {
    let title: String
    let description: String
}

let infoScreens = [
    InfoModel(title: InfoTxt.whyTitle, description: InfoTxt.why),
    InfoModel(title: InfoTxt.logicalApproachTitle, description: InfoTxt.logicalApproach),
    InfoModel(title: InfoTxt.popularStrategiesTitle, description: InfoTxt.sixPopularStrategies),
    InfoModel(title: InfoTxt.simulatorTitle, description: InfoTxt.simulator),
    InfoModel(title: InfoTxt.perfomanceTitle, description: InfoTxt.perfomanceAnalysis),
]

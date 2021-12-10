//
//  newsRepository.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 24.11.2021.
//

import UIKit

class NewsRepository {
    var newsBlock = [GroupsNews]()
    
    init() {
        setupArray()
    }
    
    func setupArray() {
        let news1 = GroupsNews(groups: Group(name: "Мир технологий", imagename: "Мир технологий"), thematicsNews: .science, time: "14:56", date: "15.06.2021", textContentPost: "Ученым из Австрии удалось вырастить сердце из человеческих стволовых клеток, искусственный орган размером не превышает кунжутного семени.", imageContentPost: [UIImage(named: "1сердце")!,UIImage(named: "2сердце")!,UIImage(named: "3сердце")!,UIImage(named: "4сердце")!])
        let news2 = GroupsNews(groups: Group(name: "Indi Music", imagename: "Indi Music"), thematicsNews: .music, time: "17:17", date: "15.06.2021", textContentPost: "Полный вдохновения альбом группы в обновленном составе.", imageContentPost: [UIImage(named: "1новыймир")!,UIImage(named: "2новыймир")!,UIImage(named: "3новыймир")!,UIImage(named: "4новыймир")!])
        let news3 = GroupsNews(groups: Group(name: "Фильмы 365", imagename: "Фильмы 365"), thematicsNews: .films, time: "19:46", date: "15.06.2021", textContentPost: "Что посмотреть этим вечером? Сегодня отличный день для научной фантастики!", imageContentPost: [UIImage(named: "1научнофантфильмы")!,UIImage(named: "3научнофантфильмы")!,UIImage(named: "4научнофантфильмы")!])
        let news4 = GroupsNews(groups: Group(name: "Animals", imagename: "Animals"), thematicsNews: .animals, time: "16:27", date: "15.06.2021", textContentPost: "Посмотрите на этих прекрасных сурков, греющихся под лампой)", imageContentPost: [UIImage(named: "1сурки")!,UIImage(named: "2сурки")!,UIImage(named: "3сурки")!])
        let news5 = GroupsNews(groups: Group(name: "Nature", imagename: "Nature"), thematicsNews: .nature, time: "13:34", date: "15.06.2021", textContentPost: "Челябинская область. Златоуст. Национальный парк «Таганай»", imageContentPost: [UIImage(named: "1таганай")!,UIImage(named: "2таганай")!,UIImage(named: "3таганай")!,UIImage(named: "4таганай")!])
        let news6 = GroupsNews(groups: Group(name: "Indi Music", imagename: "Indi Music"), thematicsNews: .music, time: "11:15", date: "15.06.2021", textContentPost: "Лучшие моменты в клипе группы СБПЧ - «Злой»", imageContentPost: [UIImage(named: "1злой")!,UIImage(named: "3злой")!])

        newsBlock.append(news1)
        newsBlock.append(news2)
        newsBlock.append(news3)
        newsBlock.append(news4)
        newsBlock.append(news5)
        newsBlock.append(news6)
    }

}

//
//  Book.swift
//  BookStore
//
//  Created by Wai Thura Tun on 20/04/2024.
//

import Foundation

class Book {
    let id: Int
    let imageUrl: String
    let title: String
    let author: String
    let rating: Float16
    let aboutAuthor: String
    let overview: String
    let price: Double
    var isBookMark: Bool
    var isRecommended: Bool = false
    
    init(id: Int, imageUrl: String, title: String, author: String, rating: Float16, aboutAuthor: String, overview: String, price: Double, isBookMark: Bool, isRecommended: Bool = false) {
        self.id = id
        self.imageUrl = imageUrl
        self.title = title
        self.author = author
        self.rating = rating
        self.aboutAuthor = aboutAuthor
        self.overview = overview
        self.price = price
        self.isBookMark = isBookMark
        self.isRecommended = isRecommended
    }
    
    static func getDummyBook() -> [Book] {
        return [
            .init(id: 1, imageUrl: "harry_potter_chp_1", title: "Harry Potter and the Philosopher's Stone", author: "J. K. Rowling", rating: 4.0, aboutAuthor: "J.K. Rowling, born July 31, 1965, in Yate, England, achieved global fame with the Harry Potter series, selling over 500 million copies. Beyond Potter, her adult novels and philanthropy showcase her diverse talents. Honored for her literary and humanitarian contributions, Rowling remains an influential figure, inspiring audiences worldwide.", overview: "\"Harry Potter and the Philosopher's Stone,\" the debut novel by J.K. Rowling, introduces readers to the enchanting world of Hogwarts School of Witchcraft and Wizardry. Published in 1997, it follows the adventures of Harry Potter, an orphaned boy who discovers he is a wizard on his eleventh birthday. He learns about his magical heritage and attends Hogwarts, where he befriends Hermione Granger and Ron Weasley. Together, they unravel mysteries surrounding the Philosopher's Stone, an object that grants immortality. Filled with magic, friendship, and the battle between good and evil, the book sets the stage for the beloved Harry Potter series.", price: 10000, isBookMark: false, isRecommended: true),
            
                .init(id: 2, imageUrl: "harry_potter_chp_2", title: "Harry Potter and the Chamber of Secrets", author: "J. K. Rowling", rating: 3.0, aboutAuthor: "J.K. Rowling, born July 31, 1965, in Yate, England, achieved global fame with the Harry Potter series, selling over 500 million copies. Beyond Potter, her adult novels and philanthropy showcase her diverse talents. Honored for her literary and humanitarian contributions, Rowling remains an influential figure, inspiring audiences worldwide.", overview: "\"Harry Potter and the Chamber of Secrets\" is the second installment in J.K. Rowling's Harry Potter series. Published in 1998, it continues the magical journey of Harry Potter, a young wizard, and his friends Hermione Granger and Ron Weasley. Set during Harry's second year at Hogwarts School of Witchcraft and Wizardry, the trio faces new challenges as they uncover the mystery of the Chamber of Secrets, a hidden chamber within the school rumored to house a deadly creature. Filled with suspense, humor, and the bonds of friendship, the book explores themes of courage, loyalty, and the battle between good and evil.", price: 20000, isBookMark: false),
            
                .init(id: 3, imageUrl: "harry_potter_chp_3", title: "Harry Potter and the Prisoner of Azkaban", author: "J. K. Rowling", rating: 4.0, aboutAuthor: "J.K. Rowling, born July 31, 1965, in Yate, England, achieved global fame with the Harry Potter series, selling over 500 million copies. Beyond Potter, her adult novels and philanthropy showcase her diverse talents. Honored for her literary and humanitarian contributions, Rowling remains an influential figure, inspiring audiences worldwide.", overview: "\"Harry Potter and the Prisoner of Azkaban\" is the third book in J.K. Rowling's Harry Potter series. Published in 1999, it follows Harry Potter's third year at Hogwarts School of Witchcraft and Wizardry. As Harry returns to school, he learns about Sirius Black, a notorious prisoner who has escaped from Azkaban, the wizarding prison. Amidst rumors of Black's connection to Harry's past and fears of his return, Harry discovers the truth behind his parents' deaths and confronts the dark forces that threaten the wizarding world. Filled with mystery, friendship, and moments of bravery, the book delves deeper into the complexities of magic and morality.", price: 30000, isBookMark: true),
            
                .init(id: 4, imageUrl: "harry_potter_chp_4", title: "Harry Potter and the Goblet of Fire", author: "J. K. Rowling", rating: 4.0, aboutAuthor: "J.K. Rowling, born July 31, 1965, in Yate, England, achieved global fame with the Harry Potter series, selling over 500 million copies. Beyond Potter, her adult novels and philanthropy showcase her diverse talents. Honored for her literary and humanitarian contributions, Rowling remains an influential figure, inspiring audiences worldwide.", overview: "\"Harry Potter and the Goblet of Fire\" is the fourth book in J.K. Rowling's Harry Potter series. Published in 2000, it follows Harry's fourth year at Hogwarts School of Witchcraft and Wizardry. The story takes a darker turn as Harry finds himself unexpectedly entered into the Triwizard Tournament, a dangerous competition between wizarding schools. Alongside his friends Hermione Granger and Ron Weasley, Harry faces challenges, encounters new magical creatures, and uncovers sinister plots. As the tournament unfolds, Harry must confront his fears, navigate complex relationships, and confront the rising threat of Lord Voldemort. Filled with adventure, mystery, and moments of both triumph and tragedy, the book marks a turning point in the series, setting the stage for the looming conflict between good and evil.", price: 40000, isBookMark: false),
            
                .init(id: 5, imageUrl: "harry_potter_chp_5", title: "Harry Potter and the Order of the Phoenix", author: "J. K. Rowling", rating: 5.0, aboutAuthor: "J.K. Rowling, born July 31, 1965, in Yate, England, achieved global fame with the Harry Potter series, selling over 500 million copies. Beyond Potter, her adult novels and philanthropy showcase her diverse talents. Honored for her literary and humanitarian contributions, Rowling remains an influential figure, inspiring audiences worldwide.", overview: "\"Harry Potter and the Order of the Phoenix\" is the fifth book in J.K. Rowling's Harry Potter series. Published in 2003, it follows Harry Potter's tumultuous fifth year at Hogwarts School of Witchcraft and Wizardry. As Voldemort's return becomes widely known, Harry faces skepticism and resistance from the wizarding community, including the Ministry of Magic. Amidst these challenges, Harry and his friends form \"Dumbledore's Army\" to prepare for the impending battle against the Dark Lord. The book explores themes of resistance, prejudice, and the power of unity, while delving into Harry's struggles with adolescence and his connection to Voldemort. Filled with action, intrigue, and emotional depth, \"Order of the Phoenix\" sets the stage for the climactic showdown between Harry and Voldemort in the series' final installments.", price: 50000, isBookMark: false, isRecommended: true),
            
                .init(id: 6, imageUrl: "harry_potter_chp_6", title: "Harry Potter and the Half-Blood Prince", author: "J. K. Rowling", rating: 5.0, aboutAuthor: "J.K. Rowling, born July 31, 1965, in Yate, England, achieved global fame with the Harry Potter series, selling over 500 million copies. Beyond Potter, her adult novels and philanthropy showcase her diverse talents. Honored for her literary and humanitarian contributions, Rowling remains an influential figure, inspiring audiences worldwide.", overview: "\"Harry Potter and the Half-Blood Prince\" is the sixth book in J.K. Rowling's Harry Potter series. Published in 2005, it continues the saga of Harry Potter's journey through the wizarding world. In this installment, Harry returns to Hogwarts School of Witchcraft and Wizardry for his sixth year, where he receives private lessons from Professor Dumbledore. Together, they delve into Voldemort's past to uncover the secrets of his immortality and search for Horcruxes, objects that contain fragments of his soul. Meanwhile, Harry navigates teenage romance, friendships, and the brewing war against the Dark Lord. As tensions rise and alliances are tested, Harry and his friends face difficult choices and heartbreaking losses. \"Half-Blood Prince\" sets the stage for the epic conclusion of the series, as the wizarding world prepares for the final battle between good and evil.", price: 60000, isBookMark: true),
            
                .init(id: 7, imageUrl: "harry_potter_chp_7", title: "Harry Potter and the Deathly Hallows", author: "J. K. Rowling", rating: 5.0, aboutAuthor: "J.K. Rowling, born July 31, 1965, in Yate, England, achieved global fame with the Harry Potter series, selling over 500 million copies. Beyond Potter, her adult novels and philanthropy showcase her diverse talents. Honored for her literary and humanitarian contributions, Rowling remains an influential figure, inspiring audiences worldwide.", overview: "\"Harry Potter and the Deathly Hallows\" is the seventh and final book in J.K. Rowling's Harry Potter series. Published in 2007, it concludes the epic tale of Harry Potter's struggle against the dark wizard Voldemort. As Voldemort's power grows, Harry, Hermione Granger, and Ron Weasley embark on a perilous quest to destroy the Horcruxes, objects containing fragments of Voldemort's soul. Their journey takes them across the wizarding world, facing danger, loss, and betrayal at every turn. As the final confrontation with Voldemort looms, Harry discovers the true power of love, sacrifice, and friendship. Filled with suspense, action, and emotional depth, \"Deathly Hallows\" brings the Harry Potter series to a satisfying and unforgettable conclusion.", price: 70000, isBookMark: false),
            
                .init(id: 8, imageUrl: "harry_potter_chp_8", title: "Harry Potter and the Cursed Child", author: "J. K. Rowling", rating: 5.0, aboutAuthor: "J.K. Rowling, born July 31, 1965, in Yate, England, achieved global fame with the Harry Potter series, selling over 500 million copies. Beyond Potter, her adult novels and philanthropy showcase her diverse talents. Honored for her literary and humanitarian contributions, Rowling remains an influential figure, inspiring audiences worldwide.", overview: "\"Harry Potter and the Cursed Child\" is a two-part stage play written by Jack Thorne based on an original story by J.K. Rowling, John Tiffany, and Jack Thorne. Premiering in 2016, it serves as a continuation of the Harry Potter series, set nineteen years after the events of \"Deathly Hallows.\" The story follows Harry Potter, now an overworked employee at the Ministry of Magic, and his son Albus Severus Potter, who struggles to live up to his family's legacy at Hogwarts School of Witchcraft and Wizardry. As Albus grapples with the weight of his father's past, he embarks on a journey through time, encountering familiar faces and confronting new challenges. \"Cursed Child\" explores themes of family, identity, and the enduring power of friendship, offering fans a glimpse into the next generation of wizards in the wizarding world.", price: 80000, isBookMark: true),
            
        ]
    }
    
}

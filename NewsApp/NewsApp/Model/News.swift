//
//  News.swift
//  NewsApp
//
//  Created by Imran on 21/9/20.
//

import Foundation


struct NewsEnvelope: Decodable {
    let status: String
    let totalResults: Int
    let articles: [News]
}



struct News: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
}

/*
     "author": "adam@letstalkbitcoin.com (The LTB Network), The LTB Network",
     "title": "WBD257 - Bitcoin Has Entered Phase 5 with PlanB, Jeff Booth & Preston Pysh",
     "description": "When Plan released his revised Stock-to-Flow model as a Cross Asset Model (S2FX), he added a new concept: phase transitions. This revision to the model takes into consideration the evolution of Bitcoin's use and meaning, as such, from proof of concept to paym…",
     "url": "https://letstalkbitcoin.com/blog/post/wbd257-bitcoin-has-entered-phase-with-planb-jeff-booth-preston-pysh?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+TheDailyBitcoinShow+%28Let%27s+Talk+Bitcoin+Network+Feed%29",
     "urlToImage": "https://letstalkbitcoin.com/files/blogs/8866-26878a3241c62e3298252d9f3c5eaa879c645e21d76715445cb2315d32d1e665.jpg",
     "publishedAt": "2020-09-21T16:26:00Z",
     "content": "Click to download audio version\r\n&lt;iframe style=\"border: none\" src=\"//html5-player.libsyn.com/embed/episode/id/15883871/height/360/theme/legacy/thumbnail/yes/direction/backward/\"; height=\"360\" widt… [+1596 chars]"
     },
 
 */

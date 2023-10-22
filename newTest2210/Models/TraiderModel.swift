//
//  TraiderModel.swift
//  newTest2210
//
//  Created by Александр Молчан on 22.10.23.
//

import UIKit

final class TraiderModel {
    var name: String
    var country: UIImage
    var deposit: Int
    var profit: Int
    
    init(name: String, country: UIImage, deposit: Int, profit: Int) {
        self.name = name
        self.country = country
        self.deposit = deposit
        self.profit = profit
    }
}

enum CurrencyTypes: String, CaseIterable {
    case gpbUsd = "GPB/USD"
    case eurUsd = "EUR/USD"
    
    var url: String {
        switch self {
            case .gpbUsd:
                "https://www.tradingview-widget.com/embed-widget/symbol-overview/?locale=en#%7B%22symbols%22%3A%5B%5B%22FX%3AGBPUSD%7C1D%22%5D%5D%2C%22chartOnly%22%3Atrue%2C%22width%22%3A%22100%25%22%2C%22height%22%3A%22100%25%22%2C%22colorTheme%22%3A%22dark%22%2C%22showVolume%22%3Afalse%2C%22showMA%22%3Afalse%2C%22hideDateRanges%22%3Atrue%2C%22hideMarketStatus%22%3Afalse%2C%22hideSymbolLogo%22%3Afalse%2C%22scalePosition%22%3A%22right%22%2C%22scaleMode%22%3A%22Normal%22%2C%22fontFamily%22%3A%22-apple-system%2C%20BlinkMacSystemFont%2C%20Trebuchet%20MS%2C%20Roboto%2C%20Ubuntu%2C%20sans-serif%22%2C%22fontSize%22%3A%2210%22%2C%22noTimeScale%22%3Afalse%2C%22valuesTracking%22%3A%222%22%2C%22changeMode%22%3A%22price-and-percent%22%2C%22chartType%22%3A%22bars%22%2C%22maLineColor%22%3A%22%232962FF%22%2C%22maLineWidth%22%3A1%2C%22maLength%22%3A9%2C%22lineType%22%3A1%2C%22dateRanges%22%3A%5B%221d%7C1%22%2C%221m%7C30%22%2C%223m%7C60%22%2C%2212m%7C1D%22%2C%2260m%7C1W%22%2C%22all%7C1M%22%5D%2C%22upColor%22%3A%22%2322ab94%22%2C%22downColor%22%3A%22%23f7525f%22%2C%22utm_source%22%3A%22www.tradingview.com%22%2C%22utm_medium%22%3A%22widget_new%22%2C%22utm_campaign%22%3A%22symbol-overview%22%2C%22page-uri%22%3A%22www.tradingview.com%2Fwidget%2Fsymbol-overview%2F%22%7D"
            case .eurUsd:
                "https://www.tradingview-widget.com/embed-widget/symbol-overview/?locale=en#%7B%22symbols%22%3A%5B%5B%22FX%3AEURUSD%7C1D%22%5D%5D%2C%22chartOnly%22%3Atrue%2C%22width%22%3A500%2C%22height%22%3A500%2C%22colorTheme%22%3A%22dark%22%2C%22showVolume%22%3Afalse%2C%22showMA%22%3Afalse%2C%22hideDateRanges%22%3Atrue%2C%22hideMarketStatus%22%3Afalse%2C%22hideSymbolLogo%22%3Afalse%2C%22scalePosition%22%3A%22right%22%2C%22scaleMode%22%3A%22Normal%22%2C%22fontFamily%22%3A%22-apple-system%2C%20BlinkMacSystemFont%2C%20Trebuchet%20MS%2C%20Roboto%2C%20Ubuntu%2C%20sans-serif%22%2C%22fontSize%22%3A%2210%22%2C%22noTimeScale%22%3Afalse%2C%22valuesTracking%22%3A%222%22%2C%22changeMode%22%3A%22price-and-percent%22%2C%22chartType%22%3A%22bars%22%2C%22maLineColor%22%3A%22%232962FF%22%2C%22maLineWidth%22%3A1%2C%22maLength%22%3A9%2C%22lineType%22%3A1%2C%22dateRanges%22%3A%5B%221d%7C1%22%2C%221m%7C30%22%2C%223m%7C60%22%2C%2212m%7C1D%22%2C%2260m%7C1W%22%2C%22all%7C1M%22%5D%2C%22upColor%22%3A%22%2322ab94%22%2C%22downColor%22%3A%22%23f7525f%22%2C%22utm_source%22%3A%22www.tradingview.com%22%2C%22utm_medium%22%3A%22widget_new%22%2C%22utm_campaign%22%3A%22symbol-overview%22%2C%22page-uri%22%3A%22www.tradingview.com%2Fwidget%2Fsymbol-overview%2F%22%7D"
        }
    }
}

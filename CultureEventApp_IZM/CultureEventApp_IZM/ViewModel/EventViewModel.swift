//
//  EventViewModel.swift
//  CultureEventApp_IST
//
//  Created by Mehdican Büyükplevne on 26.05.2023.
//

import Foundation

final class EventViewModel {
    var eventData: [EventModel] = []
    var detail: EventModel?
    
    var eventHandler: ((_ event: EventEnum) -> Void)?
    
    func fetchEventData() {
        APIManager.shared.request(modelType: [EventModel].self, type: EventEndPoint.getEvent) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let events):
                let filterEvent = events
                self.eventData = filterEvent
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
}

extension EventViewModel {
    enum EventEnum {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}

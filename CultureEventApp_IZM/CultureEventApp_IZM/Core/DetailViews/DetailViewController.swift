//
//  DetailViewController.swift
//  CultureEventApp_IST
//
//  Created by Mehdican Büyükplevne on 27.05.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventCenterLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var finishDateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var viewModel = EventViewModel()
    var selected: EventModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchEventData()
        observedEvent()
        if let selectedEvent = selected {
            detailSetup(model: selectedEvent)
        }
        
        
    }
    
    private func observedEvent() {
        viewModel.eventHandler = { [ weak self ] event in
            guard let self else { return }
            switch event {
            case .loading:
                print("loading")
            case .stopLoading:
                print("stopLoading")
            case .dataLoaded:
                DispatchQueue.main.async {
                    if let detail = self.viewModel.detail {
                        self.detailSetup(model: detail)
                    }
                }
            case .error(let error):
                print("------------Error------------")
            }
        }
    }
    
    
    private func detailSetup(model: EventModel) {
        bannerImageView.setImage(with: model.KucukAfis!)
        categoryLabel.text = model.Tur
        eventNameLabel.text = model.Adi
        eventCenterLabel.text = model.EtkinlikMerkezi
        startDateLabel.text = model.EtkinlikBaslamaTarihi
        finishDateLabel.text = model.EtkinlikBitisTarihi
        descLabel.text = model.KisaAciklama
    }

}

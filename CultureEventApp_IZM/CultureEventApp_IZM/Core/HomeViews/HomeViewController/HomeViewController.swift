//
//  HomeViewController.swift
//  CultureEventApp_IST
//
//  Created by Mehdican Büyükplevne on 26.05.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = EventViewModel()

        
    override func loadView() {
        let homeView = Bundle.main.loadNibNamed("HomeViewController", owner: self)?.first as? UIView
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        viewModel.fetchEventData()
        observedEvent()
    }
    
    func observedEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            switch event {
            case .loading:
                print("loading")
            case .stopLoading:
                print("stoploading")
            case .dataLoaded:
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .error(let error):
                print("error")
            }
        }
    }
    
    
    private func setCollectionView () {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionView.collectionViewLayout = layout
    }

}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.eventData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        cell.bannerImage.setImage(with: viewModel.eventData[indexPath.row].KucukAfis!)
        return cell
    }

}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.selected = viewModel.eventData[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height: CGFloat = 250
        return CGSize(width: width, height: height)
    }

}

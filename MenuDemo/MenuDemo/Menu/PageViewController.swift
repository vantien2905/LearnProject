//
//  KPageViewController.swift
//  NCS
//
//  Created by Kai Pham on 11/21/17.
//  Copyright © 2017 sg.vinova.nsc. All rights reserved.
//

import UIKit

class PageViewController: BaseViewController {
    
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        
        return view
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis  = UILayoutConstraintAxis.vertical
        stack.distribution  = UIStackViewDistribution.fill
        stack.alignment = UIStackViewAlignment.center
        stack.spacing   = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let vContaintMenu: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white

        return view
    }()

    let vMenu: PageMenuView = {
        let view = PageMenuView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    let cvContentController: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true

        return cv
    }()
    var currentIndexVariable: Int = 0

    let cellId = "CellId"
    var currentIndex = 0 {
        didSet {
            self.currentIndexVariable = currentIndex
        }
    }

    var lcHeightMenu: NSLayoutConstraint?
    var lcWidthMenu: NSLayoutConstraint?
    var centerXMenu: NSLayoutConstraint?
    var lcHeightHeader: NSLayoutConstraint?

    var controllers: [UIViewController] = [] {
        didSet {
            cvContentController.reloadData()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollToController(index: currentIndex)

        if Utils.isLandscape() {
            print(" Utils.isLandscape()  ")
        } else {
            centerXMenu?.constant = 0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        configureCollection()
        vMenu.delegate = self
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func fontSettingChanged() {
        vMenu.cvMenu.reloadData()
    }

    func setUpView() {
        self.view.addSubview(stackView)
        stackView.addArrangedSubview(headerView)
        stackView.addArrangedSubview(vContaintMenu)
        stackView.addArrangedSubview(cvContentController)
//        self.view.addSubview(headerView)
//        self.view.addSubview(vContaintMenu)
        self.vContaintMenu.addSubview(vMenu)
//        self.view.addSubview(cvContentController)
        setLayoutSubview()
        
    }
    
    func setLayoutSubview() {
        if #available(iOS 11, *) {
            //---
            lcHeightHeader = headerView.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 50)
            lcHeightHeader?.isActive = true
            headerView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 0, leftConstant: 0, rightConstant: 0)
            
            vContaintMenu.anchor(headerView.safeAreaLayoutGuide.bottomAnchor, left: headerView.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: headerView.safeAreaLayoutGuide.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            lcHeightMenu = vContaintMenu.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 49)
            lcHeightMenu?.isActive = true
            
            vMenu.fillVerticalSuperview()
            lcWidthMenu = vMenu.widthAnchor.constraint(equalToConstant: Utils.getMinimumWidthHeight())
            lcWidthMenu?.isActive = true
            //            vMenu.centerXToSuperview()
            centerXMenu = vMenu.centerXAnchor.constraint(equalTo: vContaintMenu.safeAreaLayoutGuide.centerXAnchor, constant: 0)
            centerXMenu?.isActive = true
            
            cvContentController.anchor(vContaintMenu.safeAreaLayoutGuide.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        } else {
            
            lcHeightHeader = headerView.heightAnchor.constraint(equalToConstant: 50)
            lcHeightHeader?.isActive = true
            headerView.anchor(view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, rightConstant: 0)
            //---
            vContaintMenu.anchor(headerView.bottomAnchor, left: headerView.leftAnchor, bottom: nil, right: headerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            lcHeightMenu = vContaintMenu.heightAnchor.constraint(equalToConstant: 49)
            lcHeightMenu?.isActive = true
            
            vMenu.fillVerticalSuperview()
            lcWidthMenu = vMenu.widthAnchor.constraint(equalToConstant: Utils.getMinimumWidthHeight())
            lcWidthMenu?.isActive = true
            //            vMenu.centerXToSuperview()
            centerXMenu = vMenu.centerXAnchor.constraint(equalTo: vContaintMenu.centerXAnchor, constant: 0)
            centerXMenu?.isActive = true
            
            cvContentController.anchor(vContaintMenu.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        }
    }
}

extension PageViewController: PageMenuViewDelegate {
    func setUpViewMenu(menuColorBackground: UIColor, menuFont: UIFont, menuColorNormal: UIColor, menuColorSelected: UIColor, menuColorHorizontal: UIColor, heightHorizontal: CGFloat, listItem: [Category], isFull: Bool = false, isHaveLineTop: Bool = false, heightHeader: CGFloat) {
        vMenu.menuFont = menuFont
        vMenu.menuColorSelected = menuColorSelected
        vMenu.menuColorNormal = menuColorNormal
        vMenu.heightHorizontal = heightHorizontal
        vMenu.menuColorHorizontal = menuColorHorizontal
        vMenu.isFullView = isFull
        vMenu.vLineTop.isHidden = !isHaveLineTop
        vMenu.backgroundColor = menuColorBackground
        vMenu.listItem = listItem
//        vMenu.vHorizotal.setBorder(cornerRadius: heightHorizontal/2)
        lcHeightHeader?.constant = heightHeader
    }

    func reloadMenu(listItem: [AnyObject]) {
        vMenu.listItem = listItem
    }

    func itemMenuSelected(index: Int) {
        currentIndex = index
        let controller = controllers[index]
        controller.viewWillAppear(true)
        let indexPath = IndexPath(item: index, section: 0)
        cvContentController.scrollToItem(at: indexPath, at: .left, animated: true)
    }

    func scrollToController(index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        cvContentController.scrollToItem(at: indexPath, at: .left, animated: true)
        vMenu.scrollToIndex(index: index)
        let controller = controllers[index]
        controller.viewWillAppear(true)
    }
}

// MARK: handle Collection view
extension PageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func configureCollection() {
        cvContentController.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        cvContentController.delegate = self
        cvContentController.dataSource = self

        if let flow = cvContentController.collectionViewLayout as? UICollectionViewFlowLayout {
            flow.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controllers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        let controler = controllers[indexPath.item]
        addChildViewController(controler)
        controler.view.frame = cell.bounds
        cell.addSubview(controler.view)
        controler.view.fillSuperview()

        didMove(toParentViewController: controler)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let controler = controllers[indexPath.item]
        controler.view.frame = CGRect(x: 0, y: 0, width: collectionView.frame.width, height: collectionView.frame.height)
        vMenu.setHorizontal(index: currentIndex)
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int ( targetContentOffset.pointee.x / cvContentController.frame.width )
        currentIndex = index
        vMenu.scrollToIndex(index: index)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let controler = controllers[indexPath.item]
        if let _con = controler as? PageViewController {
            _con.cvContentController.reloadData()
        } else {
            controler.viewWillAppear(true)
        }
    }
}

extension PageViewController {

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        coordinator.animate(alongsideTransition: { (_) in
            self.cvContentController.collectionViewLayout.invalidateLayout()
            self.vMenu.cvMenu.collectionViewLayout.invalidateLayout()
            if self.currentIndex == 0 {
                self.cvContentController.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.currentIndex, section: 0)
                self.cvContentController.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            }
        })
    }

}

//--- PageViewControllerCell

class PageViewControllerCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }

    func setUpView() {
        self.backgroundColor = .clear
    }
}

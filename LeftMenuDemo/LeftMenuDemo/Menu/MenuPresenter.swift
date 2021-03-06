//
//  MenuPresenter.swift
//  LeftMenuDemo
//
//  Created DINH VAN TIEN on 5/4/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MenuPresenter: MenuPresenterProtocol, MenuInteractorOutputProtocol {

    weak private var view: MenuViewProtocol?
    var interactor: MenuInteractorInputProtocol?
    private let router: MenuWireframeProtocol

    init(interface: MenuViewProtocol, interactor: MenuInteractorInputProtocol?, router: MenuWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}

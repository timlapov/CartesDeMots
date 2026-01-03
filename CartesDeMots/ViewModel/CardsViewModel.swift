//
//  CardsViewModel.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import Foundation



class CardsViewModel: ObservableObject {
    @Published var addViewHandler: ModalHandler?
    @Published var editCardHandler: (card: Card, handler: ModalHandler)?
}

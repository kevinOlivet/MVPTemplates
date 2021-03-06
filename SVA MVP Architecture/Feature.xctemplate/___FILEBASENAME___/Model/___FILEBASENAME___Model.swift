//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ Transbank. All rights reserved.
//

import OPCommons

protocol ___VARIABLE_featureName___ModelLogic {
    func getData( _ completion: @escaping (Result<Bool, APIManagerError>) -> ())
}

protocol ___VARIABLE_featureName___DataStore {
    var storedEntity: ___VARIABLE_featureName___Entity! { get }
}

final class ___VARIABLE_featureName___Model: ___VARIABLE_featureName___ModelLogic, ___VARIABLE_featureName___DataStore {
    
    var service: ___VARIABLE_featureName___ServiceLogic
    var storedEntity: ___VARIABLE_featureName___Entity!
    
    init(_ service:  ___VARIABLE_featureName___ServiceLogic) {
        self.service = service
    }
    
    func getData(_ completion: @escaping (Result<Bool, APIManagerError>) -> ()) {
        self.service.getDataFromAPI { result in
            switch result {
            case .success(let storedEntity):
                self.storedEntity = storedEntity
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

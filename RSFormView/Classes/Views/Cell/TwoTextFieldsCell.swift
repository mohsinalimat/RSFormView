//
//  TwoTextFieldsCell.swift
//  RSFormView
//
//  Created by Germán Stábile on 1/29/19.
//  Copyright © 2019 Rootstrap. All rights reserved.
//

import Foundation
import UIKit

class TwoTextFieldsCell: UITableViewCell, FormViewCell {
  
  static let reuseIdentifier = "TwoTextFieldsCellIdentifier"
  
  @IBOutlet weak var firstTextField: TextFieldView!
  @IBOutlet weak var secondTextField: TextFieldView!
  
  weak var delegate: FormCellDelegate?
  
  override func awakeFromNib() {
    firstTextField.delegate = self
    secondTextField.delegate = self
  }
  
  func update(withFormItem formItem: FormItem) {
    guard formItem.formFields.count == 2 else { return }
    
    let firstFieldData = formItem.formFields[0]
    let secondFieldData = formItem.formFields[1]
    
    update(textFieldView: firstTextField, withData: firstFieldData)
    update(textFieldView: secondTextField, withData: secondFieldData)
  }
  
  func update(textFieldView: TextFieldView, withData data: FormField) {
    textFieldView.update(withData: data)
  }
  
  func updateErrorState() {
    firstTextField.updateErrorState()
    secondTextField.updateErrorState()
  }
}

extension TwoTextFieldsCell: TextFieldDelegate {
  func didUpdate(textFieldView: TextFieldView, with fieldData: FormField) {
    textFieldView.textField.text = fieldData.value
    update(textFieldView: textFieldView, withData: fieldData)
    delegate?.didUpdate(data: fieldData)
  }
}

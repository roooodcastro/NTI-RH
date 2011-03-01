class ValidEmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.nil? or !value.match(/[a-z0-9!#\$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#\$%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)/)
      record.errors[attribute] << "Endereço de email inválido"
    end
  end
end
module ApplicationHelper

  def user_is_admin?
    current_user and current_user.email == "nti.rhadmin@gmail.com"
  end

  def pluralize_word(count, word)
    return ActiveSupport::Inflector.pluralize(word) if count != 1
    return word
  end

  def niveis_de_conhecimento
    return [["Nenhum", 0], ["Básico", 1],["Intermediário", 2],["Avançado", 3],["Domínio", 4]]
  end

  def profile_belongs_to_current_pessoa id_profile
    if current_pessoa
      return id_profile == current_pessoa.id
    end
    true
  end

  def current_vinculo
    Vinculo.find_last_by_pessoa_id(current_pessoa.id)
  end

  def pessoa_possui_vinculo_antigo pessoa
    vinculos = Vinculo.find_all_by_pessoa_id pessoa.id
    vinculos.each do |vinculo|
      return true if vinculo.dataSaida == nil
    end
    false
  end

  def distance_of_time(from_time, options = {})
    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time = Time.now
    distance_in_hours = (((to_time - from_time).abs)/3600).round
    I18n.with_options :locale => options[:locale], :scope => :'datetime.distance_in_words' do |locale|
      case distance_in_hours
      when 0..23
        "Hoje"
      when 24..47
        "Ontem"
      when 48..167
        locale.t(:x_days, :count => distance_in_hours) + " atrás"
      when 168..719
        locale.t(:x_weeks, :count => (distance_in_hours / 168).round) + " atrás"
      when 720..8759
        locale.t(:x_months, :count => (distance_in_hours / 720).round) + " atrás"
      else
        distance_in_years           = distance_in_hours / 8760
        day_offset_for_leap_year = (distance_in_years / 4) * 1
        remainder                   = ((distance_in_hours - day_offset_for_leap_year) % 8760)
        if remainder < 2119
          locale.t(:about_x_years,  :count => distance_in_years)
        elsif remainder < 6570
          locale.t(:over_x_years,   :count => distance_in_years)
        else
          locale.t(:almost_x_years, :count => distance_in_years + 1)
        end
      end
    end
  end
end
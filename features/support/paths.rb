#Coding: utf-8
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /p(?:a|á)gina inicial/
      '/'

    when /home do usu(?:a|á)rio/
      '/admin_home'

    when /home da pessoa/
      '/home'

    when /p(?:a|á)gina de visualiza(?:c|ç)(?:a|ã)o da pessoa "(.*)"/
      pessoa = Pessoa.find_by_nome $1
      pessoa_path(pessoa.id)

    when /p(?:a|á)gina de cria(?:c|ç)(?:a|ã)o de (.*)/
      self.send("new_#{$1}_path")

    when /p(?:a|á)gina de login da pessoa/
      '/login'

    when /p(?:a|á)gina de login do admin/
      '/admin_login'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /p(?:a|á)gina de (.*)/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)

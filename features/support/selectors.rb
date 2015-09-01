module Selectors
  def path_for(identifier)
    case identifier
    when "welcome"
      root_path
    end
  end

  def locator_for(location)
    case location
    when "the page title"
      '#page_title'
    when "the menu"
      '#navbar'
    when /the (.+) area/
      "##{$1}"
    else
      raise "unrecognized location '#{location}'"
    end
  end
end

World(Selectors)

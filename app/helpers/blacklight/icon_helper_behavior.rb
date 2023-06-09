# frozen_string_literal: true

##
# Module to help generate icon helpers for SVG images
module Blacklight::IconHelperBehavior
  ##
  # Returns the raw SVG (String) for a Blacklight Icon located in
  # app/assets/images/blacklight/*.svg. Caches them so we don't have to look up
  # the svg everytime.
  # @param [String, Symbol] icon_name
  # @return [String]
  def blacklight_icon(icon_name, **kwargs)
    render "Blacklight::Icons::#{icon_name.to_s.camelize}Component".constantize.new(**kwargs)
  rescue NameError
    Blacklight.deprecation.warn(
      "Falling back on the LegacyIconComponent with \"#{icon_name}\" is deprecated. Instead create the component `Blacklight::Icons::#{icon_name.to_s.camelize}Component` for this icon."
    )

    render Blacklight::Icons::LegacyIconComponent.new(name: icon_name, **kwargs)
  end
end

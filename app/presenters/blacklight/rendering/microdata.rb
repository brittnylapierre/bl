# frozen_string_literal: true

module Blacklight
  module Rendering
    class Microdata < AbstractStep
      include ActionView::Helpers::TagHelper
      def render
        return next_step(values) unless config.itemprop && html?

        next_step(values.map { |x| itemprop(x, config.itemprop) })
      end

      private

      def itemprop(val, itemprop)
        tag.span val, itemprop: itemprop
      end
    end
  end
end

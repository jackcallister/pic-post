require 'active_support/concern'

module Lobable
  extend ActiveSupport::Concern

  included do
    after_initialize :initialize_lob

    def initialize_lob
      @lob = Lob()
    end
  end
end

require "guard"
require "guard/guard"

module Guard
  class Unicorn < Guard

    def initialize(watchers=[], options={})
      super
      @options = {
        :host     => '0.0.0.0',
        :port     => 3000,
        :workers  => 2
      }.update(options)
    end

  end
end

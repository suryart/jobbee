require 'money'

module Jobbee
  class Money
    attr_reader :money

    delegate :cents, :to => :money

    def initialize(amount, options={})
      @money = ::Money.parse([amount, (options[:currency] || Jobbee::Config[:currency])].join)
      @options = {}
      @options[:with_currency] = Jobbee::Config[:display_currency]
      @options[:symbol_position] = Jobbee::Config[:currency_symbol_position].to_sym
      @options[:no_cents] = Jobbee::Config[:hide_cents]
      @options[:decimal_mark] = Jobbee::Config[:currency_decimal_mark]
      @options[:thousands_separator] = Jobbee::Config[:currency_thousands_separator]
      @options.merge!(options)
      # Must be a symbol because the Money gem doesn't do the conversion
      @options[:symbol_position] = @options[:symbol_position].to_sym
    end

    def to_s
      @money.format(@options)
    end

    def to_html(options = { :html => true })
      output = @money.format(@options.merge(options))
      if options[:html]
        # 1) prevent blank, breaking spaces
        # 2) prevent escaping of HTML character entities
        output = output.gsub(" ", "&nbsp;").html_safe
      end
      output
    end

    def as_json(*)
      to_s
    end

    def ==(obj)
      @money == obj.money
    end
  end
end
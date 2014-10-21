require 'csv'
require 'open-uri'

module Ruboty
  module Dajare
    module Actions
      class Dajare < Ruboty::Actions::Base
        class << self
          def dajares
            @dajares ||= CSV.parse(data, headers: true).map {|row| row['label'] }
          end

          private

          def data
            @dajare_csv ||= open(url).read
          end

          def url
            'http://linkdata.org/api/1/rdf1s580i/Dajyare.csv'
          end
        end

        def call
          message.reply(self.class.dajares.sample)
        rescue => e
          message.reply(e.message)
        end
      end
    end
  end
end

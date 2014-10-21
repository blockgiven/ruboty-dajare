module Ruboty
  module Handlers
    class Dajare < Base
      on /(dajare|ダジャレ|だじゃれ|駄洒落|親父ギャグ|ギャグ|.*面白いこと.*)/, name: 'dajare', description: 'say something funny'

      def dajare(message)
        Ruboty::Dajare::Actions::Dajare.new(message).call
      end
    end
  end
end

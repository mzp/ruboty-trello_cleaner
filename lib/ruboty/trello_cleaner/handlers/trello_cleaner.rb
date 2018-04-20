# frozen_string_literal: true
require 'csv'

module Ruboty
  module Handlers
    class TrelloCleaner < Base
      env :TRELLO_DEVELOPER_PUBLIC_KEY, 'Trello Developer API key. You can obtain from https://trello.com/1/appKey/generate'
      env :TRELLO_MEMBER_TOKEN, 'Trello member token. You can obtain from https://trello.com/1/connect?key=DEVELOPER_PUBLIC_KEY&name=prpr&response_type=token&scope=read,write&expiration=never'

      on /cleanup (?<board_id>\w+) (?<delay>\d+) (?<lists>.*)/, name: 'cleanup', description: 'cleanup trello board'

      def cleanup(message)
        done, *lists = CSV.parse_line(message['lists'], col_sep: ' ')
        Ruboty::TrelloCleanup::Actions::Cleanup.new(
          message,
          developer_public_key: ENV['TRELLO_DEVELOPER_PUBLIC_KEY'],
          member_token: ENV['TRELLO_MEMBER_TOKEN']
        ).call(
          message['board_id'],
          message['delay'].to_i,
          done,
          lists
        )
      end
    end
  end
end


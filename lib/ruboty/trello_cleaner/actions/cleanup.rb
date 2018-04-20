# frozen_string_literal: true

require 'trello'
require 'pp'

module Ruboty
  module TrelloCleanup
    module Actions
      class Cleanup
        def initialize(message, options)
          @client = ::Trello::Client.new(options)
          @message = message
        end

        def call(board_id, delay, done, to_be_clean_lists)
          lists = client.find(:boards, board_id ).lists
          done_list = lists.find {|list| list.name == done }

          lists.each do |list|
            if to_be_clean_lists.include?(list.name)
              list.cards.each do |card|
                if (Time.now - card.created_at) > delay * 3_600
                  card.move_to_list(done_list)
                end
              end
            end
          end
          message.reply 'cleaned'.dup
        rescue => e
          message.reply e.message
          message.reply e.backtrace.join("\n")
        end

        private

        attr_reader :client, :message
      end
    end
  end
end

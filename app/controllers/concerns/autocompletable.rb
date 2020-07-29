module Autocompletable
  extend ActiveSupport::Concern
  include ApplicationHelper
  private
  def select2_autocomplete_results results, options={}
    final_results = []
    results.map do |result|
      if result.is_a? City
        final_results << {id: result.send(options[:id]), text: result.send(options[:value])}
      elsif result.is_a? JobTitle
        final_results << {id: result.send(options[:id]), text: formatted_title(result.send(options[:value]))}
      else result.is_a? City
        final_results << {id: result.send(options[:id]), text: result.send(options[:value]).titleize}
      end
    end
    final_results.uniq {|e| e[:text] }.first(6)
  end
end

module Activerecord
  module Mergetags
    class Merge
      def self.merge(string, obj)
        string.gsub(/\*\|([\w\.]+)\|\*/){|t| replace(t[2..-3], obj)}
      end

      private
      def self.replace(tag, obj)
        if tag.include? '.'
          portions = tag.split('.', 2)
          replace(portions[1], obj.send(portions[0].downcase.to_sym))
        else
          convert(obj[tag.downcase.to_sym])
        end
      rescue StandardError => e
        if e.class == NoMethodError
          "#{tag} ASSOCIATION MISSING"
        else
          "#{tag} #{e.class.to_s.upcase}"
        end
      end

      def self.convert(obj)
        case obj.class.to_s
          when "ActiveSupport::TimeWithZone" then obj.to_date.to_formatted_s(:long)
          else obj.to_s
        end
      end
    end
  end
end
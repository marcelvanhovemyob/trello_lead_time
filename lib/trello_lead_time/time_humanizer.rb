module TrelloLeadTime
  class TimeHumanizer
    def self.humanize_seconds(seconds)
      [[60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].inject([]){ |s, (count, name)|
        if seconds > 0
          seconds, n = seconds.divmod(count)
          s.unshift "#{n.to_i} #{name}"
        end
        s
      }.join(' ')
    end
    def self.humanize_to_days(seconds)
          days = seconds.to_f / 86400
          return "" + days.round(1).to_s
    end
    def self.work_item(label)
      if label.strip!.to_s == 'Issue'
        return 'Incident'
      end
      return 'Goal'
    end
  end
end

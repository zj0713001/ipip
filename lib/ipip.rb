require 'ipip/version'
require 'ipip/ipv4_database'

module IPIP

  class << IPIP

    def find(ip)
      locations = ipv4_database.find(ip).to_s.split
      {
        country: locations[0],
        province: locations[1],
        city: locations[2],
      }
    end

    def ipv4_database(data_file=nil)
      @ipv4_database ||= IPv4Database.new(data_file)
    end

    def locate_in_china?(ip)
      self.find(ip)[:country].in?(%w[中国 本地 本机地址 局域网])
    end
  end

end

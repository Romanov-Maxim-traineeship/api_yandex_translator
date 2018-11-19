require 'net/http'
require 'json'
require_relative 'yandex/get_langs'
require_relative 'yandex/definition'
require_relative 'yandex/translate'

module Yandex
  class Error < StandardError; end

  class Translator
    $key = 'trnsl.1.1.20181113T124855Z.265a3dbb4ed09a6b.898310b6c4a33ca9d35f5d9c39561a578b93a8b3'

    include Yandex::Translator::GetLang
    include Yandex::Translator::Definition
    include Yandex::Translator::Translate

    def self.request(url)
      uri = URI(url)
      response = Net::HTTP.post_form(uri, {'Content-Type': 'text/json'})
      JSON.parse(response.body)
    end

  end

end



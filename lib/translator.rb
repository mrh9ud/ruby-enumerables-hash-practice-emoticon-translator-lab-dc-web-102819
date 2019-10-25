require "yaml"
emoticon_file = YAML.load_file('./lib/emoticons.yml')

def load_library(emoticon_file)
  emoticons = YAML.load_file('./lib/emoticons.yml')
  emoticon_hash = {'get_meaning' => {}, 'get_emoticon' => {}}
  emoticons.each do |meaning, emote|
    eng = emote[0]
    jap = emote[1]
    emoticon_hash['get_meaning'][jap] = meaning
    emoticon_hash['get_emoticon'][eng] = jap
  end
  emoticon_hash
end

def get_japanese_emoticon(emoticon_file, emoticon_key)
  emoticon_hash = load_library(emoticon_file)
  jap_emoticon = emoticon_hash['get_emoticon'][emoticon_key]
  jap_emoticon ? jap_emoticon : 'Sorry, that emoticon was not found'
end


def get_english_meaning(emoticon_file, emoticon_key)
  emoticon_hash = load_library(emoticon_file)
  eng_meaning = emoticon_hash['get_meaning'][emoticon_key]
  eng_meaning ? eng_meaning : 'Sorry, that emoticon was not found'
end

get_english_meaning("./lib/emoticons.yml", "(Ｔ▽Ｔ)")
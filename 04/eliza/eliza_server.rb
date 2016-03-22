require 'gserver'

class ElizaServer < GServer

  def initialize(port)
    super(port)
    @request_cnt = 0
  end

  def serve(io)
    @request_cnt += 1
    log "request \##{@request_cnt}"
    loop do
      line = io.readline.strip
      log "recv: '#{line.strip}'"
      reply = eliza_logic(line)
      log "repl: '#{reply}'"
      io.puts reply
    end
  end

protected

  def eliza_logic(input)
    input = input.downcase

    case input 
      when 'hello'
        'Hello. My name is Eliza. How may I help you?'
      
      when /i have (.*)ache/
        'Maybe you should consult a doctor of medicine.'
      
      when /(.*) mother (.*)/
        'You mentioned your mother, how\'s your relationship?'
      
      when /i have (.*) problem(.*)/
        'Say, do you have any psychological problems?'
      
      when /no, (.*)/, /no (.*)/
        'Are you sure?'
      
      when /do you (.*)/
        'We were discussing you, not me.'
        
      else
        'I\'m not sure I understand you fully...'
    end
  end

end

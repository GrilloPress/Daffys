defmodule Barter do
    
    def response(offer) do
    
    "#{offer}? No deal"
    
    end
      
    def response(offer) when offer > 5 do
  
    "#{offer}? YOU GOT A DEAL!"
  
    end

end
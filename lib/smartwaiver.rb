require 'smartwaiver/agent'

module Smartwaiver
  
  mattr_accessor :api_key
  mattr_accessor :api_version
  mattr_accessor :base_url
  
  # Retrieves waivers from the Smartwaiver API.
  #
  # @param [String] rest_limit Number of records to retrieve, eg "10"
  def self.get_waivers( rest_limit = "10")
    @agent = Agent.new(@@api_key, @@api_version, rest_limit, @@base_url) 
    return @agent.request
  end

  # Retrieves list of waiver types from the Smartwaiver API.
  #
  # @param [String] rest_limit Number of records to retrieve, eg "10"
  def self.get_waivertypes( rest_limit = "10")
    @agent = Agent.new(@@api_key, @@api_version, rest_limit, @@base_url) 
    return @agent.request( "&resetapi_listofwaivertypes" )
  end
  
  # Download a PDF from Smartwaiver
  #
  # @param [String] pdf_url Encrypted PDF URL provided in the get_waivers method, eg "NTE0OWZjMDdhYzIzMnx8fGNiMjRmZjZlZWMwZjg4YzVkZDBjYzVjMDMwZjI5MzQy"  
  def self.download_pdf( pdf_url = "")
    @agent = Agent.new(@@api_key, @@api_version, false, @@base_url) 
    return @agent.download_pdf( pdf_url )
  end
  
end
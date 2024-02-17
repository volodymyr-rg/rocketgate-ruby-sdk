require 'minitest/autorun'
require_relative '../GatewayService'
require_relative '../GatewayRequest'
require_relative '../GatewayResponse'

module RocketGate
class BaseTestCase < Minitest::Test

  # @var GatewayService
  @service = nil

  # @var GatewayRequest
  @request = nil

  # @var GatewayResponse
  @response = nil

  # @var int
  @merchantId = 1

  # @var string
  @merchantPassword = 'testpassword'

  # @var string
  @customerId = nil

  # @var string
  @invoiceId = nil

  # def initialize(name)
  def setup
    puts ":::"

    @service = GatewayService.new
    @service.SetTestMode true

    @response = GatewayResponse.new
    @request = GatewayRequest.new

    # Merchant data
    @request.Set(GatewayRequest::MERCHANT_ID, @merchantId)
    @request.Set(GatewayRequest::MERCHANT_PASSWORD, @merchantPassword)

    # Customer data
    @request.Set(GatewayRequest::CUSTOMER_FIRSTNAME, "Joe")
    @request.Set(GatewayRequest::CUSTOMER_LASTNAME, "PHPTester")
    @request.Set(GatewayRequest::EMAIL, "phptest@fakedomain.com")

    # Credit card data
    @request.Set(GatewayRequest::CARDNO, "4111111111111111")
    @request.Set(GatewayRequest::EXPIRE_MONTH, "02")
    @request.Set(GatewayRequest::EXPIRE_YEAR, "2010")
    @request.Set(GatewayRequest::CVV2, "999")

    t = Time.now.to_i.to_s
    puts ":::"+(t.to_s)
    @customerId = t + '.RubyTest'
    @invoiceId = t + '.' + getTestName

    @request.Set(GatewayRequest::MERCHANT_CUSTOMER_ID, @customerId)
    @request.Set(GatewayRequest::MERCHANT_INVOICE_ID, @invoiceId)

    puts "111"
  end

  def getTestName
    raise 'implement'
  end

  #
  #  function getService() : GatewayService
  # {
  #     return clone @service;
  # }
  #
  # function getRequest() : GatewayRequest
  # {
  #     return clone @request;
  # }
  #
  # function getResponse() : GatewayResponse
  # {
  #     return clone @response;
  # }
end
end

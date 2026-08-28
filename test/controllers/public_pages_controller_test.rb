require "test_helper"

class PublicPagesControllerTest < ActionDispatch::IntegrationTest
  test "serves every public legal and Ledger page" do
    {
      "/privacy" => "Privacy policy",
      "/terms" => "Terms of use",
      "/ledger" => "BearFace Ledger",
      "/ledger/connect" => "Connect or reconnect",
      "/ledger/disconnect" => "Disconnect"
    }.each do |path, heading|
      get path
      assert_response :success
      assert_select "h1", text: heading
      assert_select "a[href='/privacy']"
      assert_select "a[href='/terms']"
    end
  end
end

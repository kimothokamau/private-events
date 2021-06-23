require "test_helper"

class EventtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eventt = eventts(:one)
  end

  test "should get index" do
    get eventts_url
    assert_response :success
  end

  test "should get new" do
    get new_eventt_url
    assert_response :success
  end

  test "should create eventt" do
    assert_difference('Eventt.count') do
      post eventts_url, params: { eventt: { creator_id: @eventt.creator_id, description: @eventt.description, title: @eventt.title } }
    end

    assert_redirected_to eventt_url(Eventt.last)
  end

  test "should show eventt" do
    get eventt_url(@eventt)
    assert_response :success
  end

  test "should get edit" do
    get edit_eventt_url(@eventt)
    assert_response :success
  end

  test "should update eventt" do
    patch eventt_url(@eventt), params: { eventt: { creator_id: @eventt.creator_id, description: @eventt.description, title: @eventt.title } }
    assert_redirected_to eventt_url(@eventt)
  end

  test "should destroy eventt" do
    assert_difference('Eventt.count', -1) do
      delete eventt_url(@eventt)
    end

    assert_redirected_to eventts_url
  end
end

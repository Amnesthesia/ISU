require 'test_helper'

class IsusControllerTest < ActionController::TestCase
  setup do
    @isu = isus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:isus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create isu" do
    assert_difference('Isu.count') do
      post :create, isu: { index: @isu.index }
    end

    assert_redirected_to isu_path(assigns(:isu))
  end

  test "should show isu" do
    get :show, id: @isu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @isu
    assert_response :success
  end

  test "should update isu" do
    patch :update, id: @isu, isu: { index: @isu.index }
    assert_redirected_to isu_path(assigns(:isu))
  end

  test "should destroy isu" do
    assert_difference('Isu.count', -1) do
      delete :destroy, id: @isu
    end

    assert_redirected_to isus_path
  end
end

require 'test_helper'

class Backend::PlanetsControllerTest < ActionController::TestCase
  setup do
    @backend_planet = backend_planets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_planets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_planet" do
    assert_difference('Backend::Planet.count') do
      post :create, backend_planet: { url: @backend_planet.url }
    end

    assert_redirected_to backend_planet_path(assigns(:backend_planet))
  end

  test "should show backend_planet" do
    get :show, id: @backend_planet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_planet
    assert_response :success
  end

  test "should update backend_planet" do
    put :update, id: @backend_planet, backend_planet: { url: @backend_planet.url }
    assert_redirected_to backend_planet_path(assigns(:backend_planet))
  end

  test "should destroy backend_planet" do
    assert_difference('Backend::Planet.count', -1) do
      delete :destroy, id: @backend_planet
    end

    assert_redirected_to backend_planets_path
  end
end

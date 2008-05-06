require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_products
    assert_difference('Products.count') do
      post :create, :products => { }
    end

    assert_redirected_to products_path(assigns(:products))
  end

  def test_should_show_products
    get :show, :id => products(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => products(:one).id
    assert_response :success
  end

  def test_should_update_products
    put :update, :id => products(:one).id, :products => { }
    assert_redirected_to products_path(assigns(:products))
  end

  def test_should_destroy_products
    assert_difference('Products.count', -1) do
      delete :destroy, :id => products(:one).id
    end

    assert_redirected_to products_path
  end
end

require './test/test_helper'

#here car represents user
class ExperimentWrapperUserTest < Minitest::Test
  def test_exists
    assert ExperimentWrapper::User
  end

  def test_it_gives_back_a_single_user
    VCR.use_cassette('one_user') do
      user = ExperimentWrapper::User.find('tjalil')
      assert_equal ExperimentWrapper::User, user.class
      
      # Check that the fields are accessible by our model
      assert_equal "tjalil", user.login
      assert_equal 3508170, user.id
      assert_equal "Toronto, Ontario", user.location
      assert_equal 29, user.public_repos
    end
  end

  def test_it_gives_back_all_the_repos
    VCR.use_cassette('all_repos') do
      user = ExperimentWrapper::User.find('tjalil')

      assert_equal 29, repos.length
    end
  end
end
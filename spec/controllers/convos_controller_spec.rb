require 'spec_helper'

describe ConvosController do
  # include Devise::TestHelpers

  # let(:convo) { mock_model(Convo).as_null_object }

  def mock_convo(stubs={})
    @mock_convo ||= mock_model(Convo, stubs).as_null_object
  end  

  before do
    @user = User.make
    request.env['warden'] = mock(Warden, :authenticate => @user, :authenticate! => @user, :authenticate? => @user)
  end


  describe "GET index" do
    it "assigns all convos as @convos" do
      Convo.stub_chain(:where, :desc, :paginate) { [mock_convo] }
      get :index
      assigns(:convos).should eq([mock_convo])
    end
  end


  describe "GET show" do
    it "assigns the requested convo as @convo" do
      Convo.stub(:find).with("37") { mock_convo }
      get :show, :id => "37"
      assigns(:convo).should be(mock_convo)
    end
  end


  describe "GET new" do
    it "assigns a new convo as @convo" do
      Convo.stub(:new) { mock_convo }
      get :new
      assigns(:convo).should be(mock_convo)
    end
  end


  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created convo as @convo" do
        Convo.stub(:new).with({'these' => 'params'}) { mock_convo(:save => true) }
        post :create, :convo => {'these' => 'params'}
        assigns(:convo).should be(mock_convo)
      end

      it "redirects to the created convo" do
        Convo.stub(:new) { mock_convo(:save => true) }
        post :create, :convo => {}
        response.should redirect_to(convo_url(mock_convo))
      end
    end


    describe "with invalid params" do
      it "assigns a newly created but unsaved convo as @convo" do
        Convo.stub(:new).with({'these' => 'params'}) { mock_convo(:save => false) }
        post :create, :convo => {'these' => 'params'}
        assigns(:convo).should be(mock_convo)
      end


      it "re-renders the 'new' template" do
        Convo.stub(:new) { mock_convo(:save => false) }
        post :create, :convo => {}
        response.should render_template("new")
      end

    end

  end

  describe "subscribe unsubscribe" do
    it "allows user to subscribe to public convo" do
      Convo.stub(:find).with("37") { mock_convo }
      mock_convo.stub(:accesible_by_user?) { true }
      mock_convo.should_receive(:add_user)
      get :subscribe, :id => "37"
      flash[:notice].should eq("You are subscribed to the conversation.")
      response.should redirect_to(convo_url(mock_convo))
    end

    it "rejects user attempt to subscribe to private convo" do
      Convo.stub(:find).with("37") { mock_convo }
      mock_convo.stub(:accesible_by_user?) { false }
      mock_convo.should_not_receive(:add_user)
      get :subscribe, :id => "37"
      flash[:notice].should eq("Sorry, but you can't access this conversation.")
      response.should redirect_to(convo_url(mock_convo))
    end
    # 
    # it "unsubscribes user from a previously subscribed convo" do
    # end
    # 
    # it "allows user to unsubscribe from a convo even if it's not subscribed" do
    # end
  end
  
end

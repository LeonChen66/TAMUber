require 'rails_helper'

RSpec.describe DriversController, type: :controller do
    before(:all) do
        @deiver_1 = Driver.create(name: "Yimin")
        @deiver_2 = Driver.create(name: "Chou")
    end

    it "#index" do
        login_with ( :user )
        get :index
        expect(response).to render_template(:index)
    end


    it "#new" do
        login_with ( :user )
        get :new
        expect(response).to have_http_status(200)
        expect(response).to render_template(:new)
    end

    it "#edit" do
        login_with ( :user )
        get :edit, params:{id: @deiver_1[:id]}
        expect(response).to have_http_status(200)
        expect(response).to render_template(:edit)
    end

    describe "#create" do
        
        before(:all) do
            @driver_params = {name: "yimin"}
        end

        it "creates record" do 
            login_with ( :user )
            expect{ post :create, params: {driver: @driver_params }}.to change{Driver.all.size}.by(1)
        end

        it "redirect on success" do
            login_with ( :user )
            post :create, params: {driver: @driver_params }
            expect(response).not_to have_http_status(200)
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(Driver)
        end

        it "show a message after create successfully" do
            login_with ( :user )
            post :create, params: {driver: @driver_params }
            expect(response).not_to have_http_status(200)
            expect(response).to have_http_status(302)
            expect(flash[:notice]).to include("Driver #{assigns(:driver).name} was successfully created.")
        end

    end

    describe "#update" do
        before(:all) do
            @driver_params = {name: "yimin"}
        end

        it "changes record" do
            login_with ( :user )
            #put :update
            post :update, params: {id: @deiver_1[:id], driver: @driver_params}
            expect(Driver.find(@deiver_1[:id])[:name]).to eq("yimin")
        end
        
        it "show a message after update successfully" do
            login_with ( :user )
            post :update, params: {id: @deiver_1[:id], driver: @driver_params}
            expect(response).not_to have_http_status(200)
            expect(response).to have_http_status(302)
            expect(flash[:notice]).to include("Driver #{assigns(:driver).name} was successfully updated.")
        end

        it "redirect on success" do
            login_with ( :user )
            post :update, params: {driver: @driver_params, id: @deiver_1[:id]}
            expect(response).not_to have_http_status(200)
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(Driver)
        end

        # it "render :edit on fail" do
        #     allow_any_instance_of(Post).to receive(:update).and_return(false)
        #     post :update, post: @driver_params, id: @deiver_1[:id]
        #     expect(response).not_to have_http_status(302)
        #     expect(response).to render_template(:edit)
        # end
    end

    describe "#destroy" do
        before(:each) do
            @driver_3 = @driver_2 || Driver.create(name: "delete_name")
        end

        it "destroy record" do
            login_with ( :user )
            expect{ delete :destroy, params: {id: @driver_3[:id]} }.to change{Driver.all.count}.by(-1)
        end 

        it "show a message after update successfully" do
            login_with ( :user )
            delete :destroy, params: {id: @driver_3[:id]}
            expect(response).not_to have_http_status(200)
            expect(response).to have_http_status(302)
            expect(flash[:notice]).to include("Driver #{(@driver_3).name} was successfully deleted.")
        end

        it "redirect_to index after destroy" do
            login_with ( :user )
            delete :destroy, params: {id: @driver_3[:id]}
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(Driver)
        end


    end
end
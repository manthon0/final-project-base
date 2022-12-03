Rails.application.routes.draw do

  get("/", { :controller => "collections", :action => "index" })

  # Routes for the Collection position resource:

  # CREATE
  post("/insert_collection_position", { :controller => "collection_positions", :action => "create" })
          
  # READ
  get("/collection_positions", { :controller => "collection_positions", :action => "index" })
  
  get("/collection_positions/:path_id", { :controller => "collection_positions", :action => "show" })
  
  # UPDATE
  
  post("/modify_collection_position/:path_id", { :controller => "collection_positions", :action => "update" })
  
  # DELETE
  get("/delete_collection_position/:path_id", { :controller => "collection_positions", :action => "destroy" })

  #------------------------------

  # Routes for the Collection resource:

  # CREATE
  post("/insert_collection", { :controller => "collections", :action => "create" })
          
  # READ
  get("/collections", { :controller => "collections", :action => "index" })
  
  get("/collections/:path_id", { :controller => "collections", :action => "show" })
  
  # UPDATE
  
  post("/modify_collection/:path_id", { :controller => "collections", :action => "update" })
  
  # DELETE
  get("/delete_collection/:path_id", { :controller => "collections", :action => "destroy" })

  #------------------------------

  # Routes for the Position resource:

  # CREATE
  post("/insert_position", { :controller => "positions", :action => "create" })
          
  # READ
  get("/positions", { :controller => "positions", :action => "index" })
  
  get("/positions/:path_id", { :controller => "positions", :action => "show" })
  
  # UPDATE
  
  post("/modify_position/:path_id", { :controller => "positions", :action => "update" })
  
  # DELETE
  get("/delete_position/:path_id", { :controller => "positions", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end

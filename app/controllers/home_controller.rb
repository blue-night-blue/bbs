class HomeController < ApplicationController

  def top

    if Post2.count>0
      recent_number=Post2.last.post_id
      number_from=recent_number-9

      @post=Post2.where(post_id:number_from..recent_number).order(created_at: :desc)
    
      @pages=(recent_number.to_f/10).ceil
    else
      @post=Post2.all
    end

  end




  def create
    if Post2.count>0
      get_post_id=Post2.last.post_id+1
    else
      get_post_id=1
    end

    @post=Post2.new(
      name:params[:name],
      content:params[:content],
      password:params[:password],
      post_id:get_post_id
      ) 

    if @post.name ==""
      @post.name = "名無し"
    end

    if params[:password] ==""
      @post.password = "uganda"
    end
    
    @post.save
    flash[:notice]="投稿しました"
    redirect_to ("/")
    
  end



  def edit
    @post=Post2.find_by(post_id: params[:id])
  end

  def update
    @post=Post2.find_by(post_id: params[:id])
    @post.name = params[:name]
    @post.content = params[:content]

    if @post.authenticate(params[:password])
      @post.save
      flash[:notice]="修正しました"
      redirect_to ("/")
    else
      @error_message = "パスワードが間違っています" 
      render ("home/edit")
    end
  end





  def delete
    @post=Post2.find_by(post_id: params[:id])
  end

  def destroy
    @post=Post2.find_by(post_id: params[:id])

    if @post.authenticate(params[:password])
      @post.destroy
      flash[:notice]="削除しました"
      redirect_to ("/")
    else
      @error_message = "パスワードが間違っています" #うまくいかない。なぜ？
      render ("home/delete")
    end
  end





  def page
    @page=params[:id].to_i
    number_to=Post2.last.post_id-10*(@page-1)
    number_from=number_to-9

    @post=Post2.where(post_id:number_from..number_to).order(created_at: :desc)

    recent_number=Post2.last.post_id
    @pages=(recent_number.to_f/10).ceil
  end





  def times_post
    @times=params[:times].to_i
    
    if Post2.count>0
      get_post_id=Post2.last.post_id+1
    else
      get_post_id=1
    end

    for i in 1..@times
      Post2.create(
        name:"連投砲",
        content:"連投その#{i}",
        password:"rentou",
        post_id:get_post_id
      )
      get_post_id+=1
    end
    
    flash[:notice]="#{@times}連投しました"
    redirect_to ("/")
    
  end
  



  


end

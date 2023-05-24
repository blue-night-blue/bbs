class HomeController < ApplicationController

  def top
    number_to=Post2.last.id
    number_from=number_to-9

    @post=Post2.where(id:number_from..number_to).order(created_at: :desc)
  end




  def create
    @post=Post2.new(
      name:params[:name],
      content:params[:content],
      password:params[:password]
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
    @post=Post2.find_by(id: params[:id])
  end

  def update
    @post=Post2.find_by(id: params[:id])
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
    @post=Post2.find_by(id: params[:id])
  end

  def destroy
    @post=Post2.find_by(id: params[:id])

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
    number_to=Post2.last.id-10*(@page-1)
    number_from=number_to-9

    @post=Post2.where(id:number_from..number_to).order(created_at: :desc)
  end


  def times_post
    @times=params[:times].to_i

    for i in 1..@times
      Post2.create(
        name:"連投砲",
        content:"連投その#{i}",
        password:"rentou"
        )
    end
    
    flash[:notice]="#{@times}連投しました"
    redirect_to ("/")
    
  end
  



  


end

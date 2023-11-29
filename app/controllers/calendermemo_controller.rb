class CalendermemoController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @memo = Memo.new
    @user = current_user
    @memos = Memo.where(user_id: current_user).order(start_time: "desc").page(params[:page]).per(8)

  end

  def edit

  end

  def create
    memo = Memo.new(memos_params)
    if memo.user_id = current_user.id
      memo.save
        flash[:notice] = "トレーニングを記録しました。"
        redirect_to memos_path
    else
      render :index
    end
  end

  def update
    if @memo.update(memos_params)
      flash[:notice] = "トレーニングを更新しました。"
      redirect_to memos_path
    else
      render :edit
    end
  end

  def destroy
    @memo.destroy
    flash[:notice] = "トレーニングを削除しました"
    redirect_to memos_path
  end

  private

  def memos_param

    params.require(:memo).permit(:user_id, :set, :menu, :start_time, :rep, :weight)
  end
end

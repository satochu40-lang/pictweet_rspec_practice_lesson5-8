require 'rails_helper'

RSpec.describe 'ツイート投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @tweet_text = Faker::Lorem.sentence
    @tweet_image = Faker::Lorem.sentence
  end
  context 'ツイート投稿ができるとき' do
  it 'ログインしたユーザーは新規投稿できる' do
    # 1. トップページに遷移する
    visit root_path

    # 2. ログインページへ移動してログインする
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_on 'Log in'

    # 3. 新規投稿ページへ移動する
    click_on '投稿する'

    # 4. フォームに情報を入力する
    fill_in 'tweet_text', with: @tweet_text
    fill_in 'tweet_image', with: @tweet_image

    # 5. 送信するとTweetモデルのカウントが1増えることを確認する
    expect {
      click_on 'SEND'
      sleep 1 # 画面遷移・保存待ちとして1秒待機を入れるとより安定します
    }.to change(Tweet, :count).by(1)
  end
 end
    
      # 新規投稿ページへのボタンがあることを確認する
      # 投稿ページに移動する
      # フォームに情報を入力する
      # 送信するとTweetモデルのカウントが1上がる
       
        
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（画像）
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（テキスト）
    
  
end